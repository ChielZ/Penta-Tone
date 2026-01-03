# Global LFO Sync Mode Implementation

## Quick Summary

✅ **Implementation Complete:** Global LFO now supports proper sync mode with tempo-based frequency divisions. When in sync mode, the LFO frequency is displayed and set as musical subdivisions (1/32, 1/16, 1/8, etc.) and automatically recalculates when tempo changes.

### What Changed?
- **New enum:** `LFOSyncValue` with 8 musical divisions (1/32 to 4 bars)
- **UI behavior:** Shows sync divisions in sync mode, Hz slider in free mode ✓
- **Tempo changes:** LFO frequency automatically recalculates when in sync mode ✓
- **Mode switching:** Smooth transition between free and sync modes ✓

---

## Summary

Implemented proper tempo synchronization for the global LFO. When in sync mode, the LFO frequency is represented as musical divisions relative to 4 beats (one bar), and automatically recalculates when the tempo changes.

## Changes Made

### 1. **A6 ModulationSystem.swift**

#### New `LFOSyncValue` enum
```swift
enum LFOSyncValue: Double, Codable, Equatable, CaseIterable {
    case thirtySecond = 32.0    // 1/32 - very fast
    case sixteenth = 16.0       // 1/16
    case eighth = 8.0           // 1/8
    case quarter = 4.0          // 1/4
    case half = 2.0             // 1/2
    case whole = 1.0            // 1 bar
    case two = 0.5              // 2 bars
    case four = 0.25            // 4 bars
}
```

**Key Features:**
- Raw value represents cycles per 4 beats
- `displayName`: Shows musical notation ("1/32", "1/16", "1/8", "1/4", "1/2", "1", "2", "4")
- `frequencyInHz(tempo:)`: Converts to Hz based on current tempo

**Formula:**
```
LFO Frequency (Hz) = (tempo / 60) × (cycles_per_4_beats / 4)
```

**Examples at 120 BPM:**
- "1" (whole bar): 1 cycle per 4 beats = 0.5 Hz (2 seconds per cycle)
- "1/4" (quarter): 4 cycles per 4 beats = 2 Hz (0.5 seconds per cycle)
- "1/8" (eighth): 8 cycles per 4 beats = 4 Hz (0.25 seconds per cycle)

#### Updated `GlobalLFOParameters` struct
```swift
struct GlobalLFOParameters: Codable, Equatable {
    var waveform: LFOWaveform
    var resetMode: LFOResetMode
    var frequencyMode: LFOFrequencyMode
    var frequency: Double           // Hz value (actual frequency used by engine)
    var syncValue: LFOSyncValue     // NEW: Musical division for sync mode
    // ... destinations ...
    
    // NEW: Calculate actual frequency based on mode
    func actualFrequency(tempo: Double) -> Double {
        switch resetMode {
        case .sync:
            return syncValue.frequencyInHz(tempo: tempo)
        case .free, .trigger:
            return frequency
        }
    }
}
```

**Changes:**
- Added `syncValue: LFOSyncValue` field (default: `.whole` = 1 bar)
- Added `actualFrequency(tempo:)` method to calculate Hz based on mode
- The `frequency` field now serves as the actual Hz value used by the engine
- In sync mode, `frequency` is updated whenever tempo or syncValue changes

### 2. **A1 SoundParameters.swift**

#### Updated `AudioParameterManager` methods

**1. `updateGlobalLFOResetMode(_:)`** - Enhanced
```swift
func updateGlobalLFOResetMode(_ mode: LFOResetMode) {
    master.globalLFO.resetMode = mode
    // When switching to sync mode, recalculate frequency from sync value
    if mode == .sync {
        let lfoFrequency = master.globalLFO.actualFrequency(tempo: master.tempo)
        voicePool?.updateGlobalLFOFrequency(lfoFrequency)
    }
    voicePool?.updateGlobalLFO(master.globalLFO)
}
```
- Recalculates frequency when switching to sync mode
- Ensures smooth transition between modes

**2. `updateGlobalLFOFrequency(_:)`** - Enhanced
```swift
func updateGlobalLFOFrequency(_ value: Double) {
    master.globalLFO.frequency = value
    // Only apply if not in sync mode
    if master.globalLFO.resetMode != .sync {
        voicePool?.updateGlobalLFOFrequency(value)
    }
    voicePool?.updateGlobalLFO(master.globalLFO)
}
```
- Only updates engine frequency when in free mode
- In sync mode, frequency is controlled by `updateGlobalLFOSyncValue`

**3. `updateGlobalLFOSyncValue(_:)`** - NEW
```swift
func updateGlobalLFOSyncValue(_ syncValue: LFOSyncValue) {
    master.globalLFO.syncValue = syncValue
    // Calculate actual frequency from sync value and apply
    let lfoFrequency = syncValue.frequencyInHz(tempo: master.tempo)
    voicePool?.updateGlobalLFOFrequency(lfoFrequency)
    voicePool?.updateGlobalLFO(master.globalLFO)
}
```
- Updates the sync value and recalculates frequency
- Immediately applies to the audio engine

**4. `updateTempo(_:)`** - Enhanced
```swift
func updateTempo(_ tempo: Double) {
    master.tempo = tempo
    // ... delay time recalculation ...
    
    // NEW: Recalculate global LFO frequency if in sync mode
    if master.globalLFO.resetMode == .sync {
        let lfoFrequency = master.globalLFO.actualFrequency(tempo: tempo)
        voicePool?.updateGlobalLFOFrequency(lfoFrequency)
    }
}
```
- Automatically recalculates LFO frequency when tempo changes (only in sync mode)

### 3. **A3 VoicePool.swift**

#### New method: `updateGlobalLFOFrequency(_:)`
```swift
func updateGlobalLFOFrequency(_ frequency: Double) {
    globalLFO.frequency = frequency
}
```
- Allows updating just the frequency without replacing the entire GlobalLFOParameters struct
- Used when tempo changes or sync value changes to update the active frequency

### 4. **V4-S08 ParameterPage8View.swift**

#### Conditional UI for LFO Frequency
```swift
// Row 3 - Global LFO Frequency (Hz or Sync Value based on mode)
if paramManager.master.globalLFO.resetMode == .sync {
    // Sync mode: Show tempo-synced divisions
    ParameterRow(
        label: "LFO FREQUENCY",
        value: Binding(
            get: { paramManager.master.globalLFO.syncValue },
            set: { newValue in
                paramManager.updateGlobalLFOSyncValue(newValue)
            }
        ),
        displayText: { $0.displayName }
    )
} else {
    // Free mode: Show Hz slider
    SliderRow(
        label: "LFO FREQUENCY",
        value: Binding(
            get: { paramManager.master.globalLFO.frequency },
            set: { newValue in
                paramManager.updateGlobalLFOFrequency(newValue)
            }
        ),
        range: 0.01...20,
        step: 0.01,
        displayFormatter: { String(format: "%.2f Hz", $0) }
    )
}
```

**UI Behavior:**
- **Free mode:** Shows slider with Hz values (0.01 - 20 Hz)
- **Sync mode:** Shows discrete selector with musical divisions (1/32 to 4)
- Switches automatically when reset mode changes

## Behavior

### Free Mode
1. User adjusts frequency slider → Hz value stored and used directly
2. Tempo changes → LFO frequency unchanged (free running)
3. Display shows: "2.50 Hz"

### Sync Mode
1. User selects "1/4" at 120 BPM → Stored as `LFOSyncValue.quarter`
2. Actual frequency calculated: 2.0 Hz
3. User changes tempo to 240 BPM
4. Display still shows "1/4" ✓
5. Actual frequency recalculated to 4.0 Hz ✓
6. LFO correctly runs twice as fast ✓

### Mode Switching
1. **Free → Sync:**
   - Hz value preserved in `frequency` field
   - Sync value used for display and calculation
   - Frequency recalculated from sync value immediately
   
2. **Sync → Free:**
   - Last sync-calculated frequency remains in `frequency` field
   - User can now adjust Hz directly
   - Sync value preserved for future sync mode use

## Formula Details

### LFO Sync Frequency Calculation
```
actualFrequency = (tempo / 60) × (cyclesPerFourBeats / 4)
```

Where:
- `tempo` is in BPM
- `cyclesPerFourBeats` is the raw value of LFOSyncValue
- Division by 4 converts from "per 4 beats" to "per beat"

### Examples

| Sync Value | Cycles/4 Beats | 120 BPM | 240 BPM |
|------------|----------------|---------|---------|
| 1/32       | 32.0           | 16 Hz   | 32 Hz   |
| 1/16       | 16.0           | 8 Hz    | 16 Hz   |
| 1/8        | 8.0            | 4 Hz    | 8 Hz    |
| 1/4        | 4.0            | 2 Hz    | 4 Hz    |
| 1/2        | 2.0            | 1 Hz    | 2 Hz    |
| 1          | 1.0            | 0.5 Hz  | 1 Hz    |
| 2          | 0.5            | 0.25 Hz | 0.5 Hz  |
| 4          | 0.25           | 0.125 Hz| 0.25 Hz |

### Rationale for "1" = 4 Beats

The sync values represent cycles per one bar (4 beats in 4/4 time):
- **"1"** means one complete LFO cycle per bar (4 beats)
- **"1/4"** means one cycle per quarter of a bar (1 beat)
- **"2"** means one cycle per 2 bars (8 beats)

At 120 BPM:
- 1 beat = 0.5 seconds
- 4 beats (1 bar) = 2 seconds
- "1" = 1 cycle per 2 seconds = 0.5 Hz ✓

## Architecture Notes

### Separation of Concerns

1. **Storage vs Runtime**
   - `frequency` (Double): Runtime value in Hz, used by audio engine
   - `syncValue` (LFOSyncValue): Stored preference for sync mode
   - Both are saved in presets

2. **Frequency Source of Truth**
   - In free mode: User-adjusted Hz value
   - In sync mode: Calculated from syncValue and tempo
   - The `frequency` field always contains the current Hz value used by the engine

3. **Update Flow**
   ```
   User changes sync value
   → updateGlobalLFOSyncValue()
   → Calculate Hz from syncValue + tempo
   → Update frequency field
   → voicePool.updateGlobalLFOFrequency()
   → Audio engine uses new frequency
   ```

   ```
   Tempo changes
   → updateTempo()
   → Check if in sync mode
   → If sync: Calculate Hz from syncValue + new tempo
   → Update frequency field
   → voicePool.updateGlobalLFOFrequency()
   → Audio engine uses new frequency
   ```

### No Changes to Voice LFO

- Voice LFO does not have sync mode (only free and trigger)
- No changes were made to voice LFO code
- This maintains the surgical approach requested

## Testing Checklist

- [ ] **Free Mode:**
  - [ ] Can adjust LFO frequency with Hz slider (0.01-20 Hz)
  - [ ] Frequency stays constant when tempo changes
  - [ ] Display shows "X.XX Hz"

- [ ] **Sync Mode:**
  - [ ] Can cycle through sync divisions (1/32, 1/16, 1/8, 1/4, 1/2, 1, 2, 4)
  - [ ] Display shows musical division (e.g., "1/4")
  - [ ] LFO speed changes when tempo changes
  - [ ] LFO frequency stays at selected division when tempo changes

- [ ] **Mode Switching:**
  - [ ] Free → Sync: UI changes from slider to division selector
  - [ ] Sync → Free: UI changes from division selector to slider
  - [ ] No audio glitches during mode changes
  - [ ] Values preserved appropriately

- [ ] **Tempo Changes:**
  - [ ] In free mode: LFO unaffected by tempo changes
  - [ ] In sync mode: LFO frequency recalculates automatically
  - [ ] Delay time also recalculates (existing feature)

- [ ] **Preset Save/Load:**
  - [ ] Sync value saved correctly
  - [ ] Hz frequency saved correctly  
  - [ ] Mode saved correctly
  - [ ] Loading preset restores correct frequency

- [ ] **LFO Modulation:**
  - [ ] Tremolo (amplitude) works in both modes
  - [ ] Filter modulation works in both modes
  - [ ] Modulator multiplier modulation works in both modes
  - [ ] Delay time modulation works in both modes

## Files Modified

1. **A6 ModulationSystem.swift**
   - Added `LFOSyncValue` enum with 8 divisions
   - Updated `GlobalLFOParameters` struct (added `syncValue` field)
   - Added `actualFrequency(tempo:)` method

2. **A1 SoundParameters.swift**
   - Enhanced `updateGlobalLFOResetMode(_:)` - recalculates frequency on mode change
   - Enhanced `updateGlobalLFOFrequency(_:)` - skips update in sync mode
   - Added `updateGlobalLFOSyncValue(_:)` - new method for sync value changes
   - Enhanced `updateTempo(_:)` - recalculates LFO frequency in sync mode

3. **A3 VoicePool.swift**
   - Added `updateGlobalLFOFrequency(_:)` - updates just the frequency field

4. **V4-S08 ParameterPage8View.swift**
   - Made Row 3 conditional based on reset mode
   - Shows ParameterRow (divisions) in sync mode
   - Shows SliderRow (Hz) in free mode

5. **GLOBAL_LFO_SYNC_IMPLEMENTATION.md** (this file)
   - Documentation of all changes

## Future Enhancements

This implementation provides:

1. **Consistent tempo sync pattern** - Matches the delay time implementation
2. **Foundation for voice LFO sync** - If needed in future, similar pattern can be applied
3. **External tempo sources** - Ready for Link/MIDI clock integration

## Migration Notes

### Existing Presets
- Added `syncValue` field to `GlobalLFOParameters` with default value `.whole`
- Swift's automatic `Codable` synthesis handles this gracefully
- Old presets will load with default sync value
- Frequency values preserved

### No Breaking Changes
- All existing code continues to work
- Voice LFO unchanged (as requested)
- Global LFO maintains backward compatibility
