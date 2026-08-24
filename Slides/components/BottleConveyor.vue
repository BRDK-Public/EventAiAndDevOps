<script setup lang="ts">
withDefaults(defineProps<{
  state?: 'running' | 'fault' | 'recovered'
  count?: number
  compact?: boolean
}>(), {
  state: 'running',
  count: 42,
  compact: false,
})
</script>

<template>
  <div class="bottle-conveyor" :class="[`is-${state}`, { compact }]">
    <div class="conveyor-header">
      <div class="machine-label">
        <span>LINE / 04</span>
        <b>CONVEYOR AXIS</b>
      </div>
      <div class="machine-state">
        <i></i>
        {{ state === 'fault' ? 'ABORTED' : state === 'recovered' ? 'COMPLETE' : 'RUNNING' }}
      </div>
    </div>

    <div class="conveyor-stage">
      <div class="axis-drive">
        <div class="drive-core"><span>M</span></div>
        <small>ACOPOS</small>
      </div>

      <div class="belt-wrap">
        <div class="bottles">
          <div
            v-for="bottleIndex in 10"
            :key="bottleIndex"
            class="bottle"
            :class="{ counted: bottleIndex <= 6 }"
          >
            <i></i>
          </div>
        </div>
        <div class="belt"><i v-for="rollerIndex in 16" :key="rollerIndex"></i></div>
      </div>

      <div class="counter-panel">
        <span>PRODUCTION</span>
        <b>{{ String(count).padStart(3, '0') }}</b>
        <small>/ 100</small>
      </div>
    </div>

    <div class="fault-rail">
      <div><span>FAULT</span><b>{{ state === 'fault' ? 'AXIS_04' : 'NONE' }}</b></div>
      <div><span>COUNTER</span><b>{{ state === 'fault' ? 'HOLD' : state === 'recovered' ? 'EXACT' : 'COUNT' }}</b></div>
      <div><span>RECOVERY</span><b>{{ state === 'fault' ? 'AWAIT CLEAR' : state === 'recovered' ? 'VERIFIED' : 'READY' }}</b></div>
    </div>
  </div>
</template>

<style scoped>
.bottle-conveyor {
  overflow: hidden;
  border: 1px solid rgba(255, 255, 255, 0.2);
  color: #fff;
  background: #202326;
  box-shadow: 0 18px 45px rgba(0, 0, 0, 0.22);
}

.conveyor-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 50px;
  padding: 0 18px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.13);
}

.machine-label span,
.machine-label b {
  display: block;
}

.machine-label span {
  margin-bottom: 4px;
  color: #8f989e;
  font: 500 7px/1 'IBM Plex Mono', monospace;
}

.machine-label b,
.machine-state {
  font: 600 10px/1 'IBM Plex Mono', monospace;
}

.machine-state {
  display: flex;
  align-items: center;
  gap: 8px;
  color: #b8c0c5;
}

.machine-state i {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: #45a96b;
  box-shadow: 0 0 0 5px rgba(69, 169, 107, 0.13);
}

.is-fault .machine-state i {
  background: #ff7a00;
  box-shadow: 0 0 0 5px rgba(255, 122, 0, 0.14);
  animation: fault-pulse 1.2s infinite;
}

.conveyor-stage {
  display: grid;
  grid-template-columns: 90px 1fr 120px;
  align-items: end;
  gap: 18px;
  min-height: 165px;
  padding: 22px 18px 24px;
  background:
    linear-gradient(0deg, rgba(255, 255, 255, 0.04) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 255, 255, 0.04) 1px, transparent 1px);
  background-size: 24px 24px;
}

.axis-drive {
  display: grid;
  place-items: center;
}

.drive-core {
  display: grid;
  width: 60px;
  height: 60px;
  place-items: center;
  border: 6px solid #6f787e;
  border-radius: 50%;
  background: #111315;
  box-shadow: inset 0 0 0 3px #ff7a00;
}

.drive-core span {
  color: #ff7a00;
  font: 700 14px/1 'IBM Plex Mono', monospace;
}

.axis-drive small {
  margin-top: 8px;
  color: #8f989e;
  font: 500 7px/1 'IBM Plex Mono', monospace;
}

.belt-wrap {
  min-width: 0;
}

.bottles {
  display: flex;
  align-items: end;
  justify-content: space-around;
  height: 74px;
  padding: 0 8px;
}

.bottle {
  position: relative;
  width: 21px;
  height: 54px;
  border: 2px solid #929ba1;
  border-radius: 5px 5px 3px 3px;
  background: rgba(255, 255, 255, 0.06);
}

.bottle::before {
  position: absolute;
  top: -9px;
  left: 5px;
  width: 7px;
  height: 9px;
  border: 2px solid #929ba1;
  border-bottom: 0;
  content: '';
}

.bottle i {
  position: absolute;
  right: 2px;
  bottom: 2px;
  left: 2px;
  height: 14px;
  background: rgba(255, 122, 0, 0.25);
}

.bottle.counted {
  border-color: #f7f8f8;
}

.bottle.counted i {
  background: #ff7a00;
}

.is-running .bottles {
  animation: belt-motion 3s linear infinite;
}

.belt {
  display: flex;
  justify-content: space-around;
  height: 20px;
  padding-top: 4px;
  border-top: 4px solid #8a9399;
  border-bottom: 4px solid #51585d;
  background: #151719;
}

.belt i {
  width: 7px;
  height: 7px;
  border-radius: 50%;
  background: #737c82;
}

.counter-panel {
  min-height: 103px;
  padding: 14px;
  border: 1px solid rgba(255, 255, 255, 0.18);
  border-left: 4px solid #ff7a00;
  background: #111315;
}

.counter-panel span,
.counter-panel b,
.counter-panel small {
  display: block;
  font-family: 'IBM Plex Mono', monospace;
}

.counter-panel span {
  color: #8f989e;
  font-size: 7px;
}

.counter-panel b {
  margin-top: 10px;
  color: #ff7a00;
  font-size: 30px;
  line-height: 1;
}

.counter-panel small {
  margin-top: 5px;
  color: #8f989e;
  font-size: 8px;
}

.fault-rail {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  border-top: 1px solid rgba(255, 255, 255, 0.14);
}

.fault-rail > div {
  min-height: 48px;
  padding: 11px 16px;
  border-right: 1px solid rgba(255, 255, 255, 0.12);
}

.fault-rail span,
.fault-rail b {
  display: block;
  font-family: 'IBM Plex Mono', monospace;
}

.fault-rail span {
  margin-bottom: 5px;
  color: #7f888e;
  font-size: 6px;
}

.fault-rail b {
  color: #c8ced2;
  font-size: 8px;
}

.is-fault .fault-rail > div:first-child,
.is-fault .fault-rail > div:nth-child(2) {
  background: rgba(255, 122, 0, 0.12);
}

.is-fault .fault-rail > div:first-child b,
.is-fault .fault-rail > div:nth-child(2) b,
.is-recovered .fault-rail b {
  color: #ff7a00;
}

.compact .conveyor-stage {
  min-height: 120px;
}

@keyframes belt-motion {
  0% { transform: translateX(-5px); }
  50% { transform: translateX(5px); }
  100% { transform: translateX(-5px); }
}

@keyframes fault-pulse {
  50% { opacity: 0.35; }
}
</style>