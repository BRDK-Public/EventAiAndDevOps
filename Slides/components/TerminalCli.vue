<script setup lang="ts">
import { computed, onBeforeUnmount, ref, watch } from 'vue'
import { useSlideContext } from '@slidev/client'

type LogMessage = {
  time: string
  severity: 'INFO' | 'WARN' | 'ERROR'
  message: string
}

type TerminalCommand = {
  time: string
  command: string
  result: string
  logMessages?: LogMessage[]
}

const commands: TerminalCommand[] = [
  { time: '09:41:02', command: 'arsim start --profile controlled', result: 'RUNNING' },
  { time: '09:41:18', command: 'build --target ARsim', result: '5 warnings · 0 errors' },
  { time: '09:41:46', command: 'pvi read PV bottleCount', result: '42 UINT' },
  { time: '09:42:05', command: 'pvi write PV main.reset := TRUE', result: 'WRITE COMPLETED' },
  {
    time: '09:42:21',
    command: 'logbook read arsyslog',
    result: 'CAPTURED',
    logMessages: [
      { time: '09:41:48', severity: 'INFO', message: 'Batch reset accepted' },
      { time: '09:41:52', severity: 'WARN', message: 'Axis 04 recovery requested' },
      { time: '09:42:03', severity: 'INFO', message: 'Bottle counter resumed at 42' },
    ],
  },
  { time: '09:42:37', command: 'pip create --configuration config ID', result: 'PIP CREATED' },
]

const { $clicks } = useSlideContext()
const currentStep = computed(() => Math.min(Math.max($clicks.value - 1, -1), commands.length - 1))
const readyThrough = ref(-1)
let resultTimer: ReturnType<typeof setTimeout> | undefined

watch(currentStep, (step) => {
  if (resultTimer)
    clearTimeout(resultTimer)

  if (step < 0) {
    readyThrough.value = -1
    return
  }

  readyThrough.value = step - 1
  resultTimer = setTimeout(() => {
    if (currentStep.value === step)
      readyThrough.value = step
  }, 900)
}, { immediate: true })

onBeforeUnmount(() => {
  if (resultTimer)
    clearTimeout(resultTimer)
})

const visibleCommands = computed(() => commands.slice(0, currentStep.value + 1))
</script>

<template>
  <div class="evidence-terminal">
    <div class="terminal-title"><i></i><i></i><i></i><span>AS-CLI · CONTROLLED OBSERVATION</span><small>EVENT VERSION TO CONFIRM</small></div>
    <div class="terminal-body">
      <div v-if="currentStep < 0" class="terminal-idle">
        <span class="time">09:40:58</span><span class="op">[AS-CLI]</span><b>awaiting bounded action...</b><em class="ok">READY</em>
      </div>
      <div v-for="(entry, entryIndex) in visibleCommands" :key="entry.command" class="terminal-entry">
        <div class="terminal-command">
          <span class="time">{{ entry.time }}</span>
          <span class="op">[AS-CLI]</span>
          <b>{{ entry.command }}</b>
          <em :class="entryIndex <= readyThrough ? 'ok' : 'pending'">{{ entryIndex <= readyThrough ? 'DONE' : '...' }}</em>
        </div>
        <div v-if="entryIndex <= readyThrough" class="terminal-output">
          <span class="output-label">OUT</span>
          <div v-if="entry.logMessages" class="logbook-output">
            <strong>{{ entry.result }}</strong>
            <table>
              <thead><tr><th>TIME</th><th>LEVEL</th><th>MESSAGE</th></tr></thead>
              <tbody>
                <tr v-for="message in entry.logMessages" :key="`${message.time}-${message.message}`">
                  <td>{{ message.time }}</td><td :class="`severity-${message.severity.toLowerCase()}`">{{ message.severity }}</td><td>{{ message.message }}</td>
                </tr>
              </tbody>
            </table>
          </div>
          <b v-else>{{ entry.result }}</b>
        </div>
      </div>
    </div>
    <div class="terminal-footer">MCP GIVES KNOWLEDGE · AS-CLI GIVES CONTROLLED ACTION + OBSERVATION</div>
  </div>
</template>

<style scoped>
.evidence-terminal {
  display: grid;
  grid-template-rows: 42px minmax(0, 1fr) auto;
  height: 514px;
}

.terminal-title {
  height: auto;
}

.terminal-body {
  min-height: 0;
  overflow-y: auto;
}

.terminal-body > .terminal-idle,
.terminal-body > .terminal-entry {
  display: block;
  min-height: 0;
  border-bottom: 0;
}

.terminal-idle,
.terminal-command {
  display: grid;
  grid-template-columns: 70px 100px 1fr 80px;
  align-items: center;
  min-height: 32px;
  font: 500 8px/1 'IBM Plex Mono', monospace;
}

.terminal-command {
  border-bottom: 1px solid rgba(255, 255, 255, 0.07);
}

.terminal-command em.pending {
  color: #8f989e;
  animation: terminal-pending 0.9s steps(2, end) infinite;
}

.terminal-output {
  display: grid;
  grid-template-columns: 70px 1fr;
  align-items: start;
  min-height: 27px;
  padding: 7px 0 8px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.07);
  color: #56bb7a;
  font: 500 8px/1.25 'IBM Plex Mono', monospace;
}

.output-label {
  color: #596267;
}

.terminal-output b,
.logbook-output strong {
  color: #56bb7a;
  font-weight: 600;
}

.logbook-output table {
  width: 100%;
  margin-top: 7px;
  border-collapse: collapse;
  color: #aeb6bb;
  font: 500 7px/1.25 'IBM Plex Mono', monospace;
}

.logbook-output th,
.logbook-output td {
  padding: 3px 6px 3px 0;
  text-align: left;
  border-bottom: 1px solid rgba(255, 255, 255, 0.07);
}

.logbook-output th {
  color: #596267;
  font-weight: 500;
}

.logbook-output td:first-child {
  color: #70797e;
}

.logbook-output .severity-info {
  color: #73a6c8;
}

.logbook-output .severity-warn {
  color: var(--br-orange);
}

@keyframes terminal-pending {
  50% { opacity: 0.35; }
}
</style>