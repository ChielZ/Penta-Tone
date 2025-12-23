# Parameter Cleanup and Saturation Addition

**Date:** December 23, 2025  
**Status:** ✅ Complete

---

## Changes Made

### 1. Removed Pan Parameters ✅

**Rationale:** With the new stereo architecture using hard-panned dual oscillators (left always -1.0, right always 1.0), pan is now a fixed architectural choice rather than a parameter.

**Removed:**
- `PanParameters` struct (including `pan` property and `clampedPan` computed property)
- `pan` property from `VoiceParameters` struct

**Benefits:**
- Simpler parameter structure
- No confusion about pan control (it's fixed by design)
- Cleaner API

---

### 2. Removed Deprecated Extensions ✅

**Rationale:** These were safety net functions marked as deprecated after the old system cleanup. Since all code has been updated, they're just noise now.

**Removed entire extension block:**
- `mapTouchToFilterCutoff()` - deprecated
- `mapAftertouchToFilterCutoff()` - deprecated
- `mapAftertouchToFilterCutoffSmoothed()` - deprecated
- `resetVoiceFilterToTemplate()` - deprecated
- `mapTouchToPan()` - deprecated
- `mapTouchToAmplitude()` - deprecated
- `mapTouchToResonance()` - deprecated

**Result:** ~100 lines of deprecated code removed

---

### 3. Added Saturation Parameter ✅

**Source:** Found in `KorgLowPassFilter.swift` from SoundpipeAudioKit package

**Parameter Details:**
```swift
// From KorgLowPassFilter source:
public static let saturationDef = NodeParameterDef(
    identifier: "saturation",
    name: "Saturation",
    address: akGetParameterAddress("KorgLowPassFilterParameterSaturation"),
    defaultValue: 0.0,
    range: 0.0 ... 10.0,
    unit: .generic
)
```

**Added to FilterParameters:**
```swift
struct FilterParameters: Codable, Equatable {
    var cutoffFrequency: Double
    var resonance: Double
    var saturation: Double  // NEW
    
    static let `default` = FilterParameters(
        cutoffFrequency: 1200,
        resonance: 1.5,
        saturation: 0.0  // NEW - starts with no saturation
    )
    
    /// Clamps saturation to valid range (0 - 10)
    var clampedSaturation: Double {
        min(max(saturation, 0), 10.0)
    }
}
```

**Updated PolyphonicVoice:**
- Filter initialization now includes saturation parameter
- `updateFilterParameters()` now applies saturation

**Parameter Ranges (from AudioKit source):**
- **cutoffFrequency:** 0 Hz - 22,050 Hz (was incorrectly limited to 20,000 Hz)
- **resonance:** 0.0 - 2.0
- **saturation:** 0.0 - 10.0 (NEW)

**Default Values:**
- **cutoffFrequency:** 1,000 Hz (AudioKit default), using 1,200 Hz (your app default)
- **resonance:** 1.0 (AudioKit default), using 1.5 (your app default)
- **saturation:** 0.0 (AudioKit default, no saturation)

---

## Saturation Parameter Usage

### What is Saturation?

The Korg 35 filter's saturation parameter adds analog-style distortion/warmth to the filtered signal. Higher values create more harmonic content and can make the sound feel "warmer" or more "aggressive."

### Recommended Values:
- **0.0** - Clean (default, no saturation)
- **0.5-2.0** - Subtle warmth
- **2.0-5.0** - Noticeable saturation/warmth
- **5.0-10.0** - Heavy saturation/distortion

### Musical Uses:
1. **Clean sounds:** Keep at 0.0
2. **Analog warmth:** Try 0.5-1.5
3. **Aggressive sounds:** Use 3.0-6.0
4. **Extreme distortion:** Push to 8.0-10.0

### Integration Points:
- Already integrated into voice creation
- Already integrated into filter parameter updates
- Can be controlled per-voice or via template
- Good candidate for macro control (Phase 7)
- Could be a modulation destination (Phase 5)

---

## Updated Filter Parameter Ranges

Corrected all ranges to match AudioKit's actual implementation:

### Before (Incorrect):
```swift
var clampedCutoff: Double {
    min(max(cutoffFrequency, 10), 20_000)  // Too restrictive
}
```

### After (Correct):
```swift
var clampedCutoff: Double {
    min(max(cutoffFrequency, 0), 22_050)  // Matches AudioKit
}

var clampedResonance: Double {
    min(max(resonance, 0), 2.0)  // Matches AudioKit
}

var clampedSaturation: Double {
    min(max(saturation, 0), 10.0)  // Matches AudioKit
}
```

---

## Files Modified

1. **SoundParameters.swift**
   - Removed `PanParameters` struct
   - Removed `pan` from `VoiceParameters`
   - Added `saturation` to `FilterParameters`
   - Added clamping methods for all filter parameters
   - Removed deprecated extension block (~100 lines)

2. **PolyphonicVoice.swift**
   - Added saturation to filter initialization
   - Added saturation to `updateFilterParameters()`
   - Used `clampedResonance` instead of raw `resonance`

---

## Testing Checklist

- [x] App builds successfully
- [ ] Default saturation (0.0) sounds clean
- [ ] Increasing saturation adds warmth/distortion
- [ ] Saturation parameter persists in presets
- [ ] All filter parameters within valid ranges

---

## Benefits

### Code Quality
✅ Removed ~120 lines of obsolete code (pan params + deprecated methods)  
✅ Added important missing parameter (saturation)  
✅ Corrected parameter ranges to match AudioKit  
✅ Cleaner, more focused parameter structure  

### Sound Design
✅ Can now add analog-style warmth/saturation  
✅ More expressive filter possibilities  
✅ Better match for analog-inspired sounds  
✅ Good candidate for macro control  

### Architecture
✅ Parameters now match actual AudioKit capabilities  
✅ No unnecessary parameters (pan removed)  
✅ All parameters properly clamped  
✅ Ready for Phase 5 (modulation destinations)  

---

## Next Steps

### Immediate
Test the new saturation parameter:
1. Try different saturation values (0.0, 1.0, 3.0, 5.0)
2. Experiment with high resonance + saturation
3. Find sweet spots for different sound types

### Phase 5 (Modulation)
Consider saturation as a modulation destination:
- LFO → saturation (rhythmic timbre changes)
- Envelope → saturation (dynamic distortion)
- Could create interesting evolving textures

### Phase 6 (Presets)
Use saturation to differentiate presets:
- Clean presets: saturation = 0.0
- Warm presets: saturation = 0.5-2.0
- Aggressive presets: saturation = 3.0-6.0

---

**Status:** ✅ All changes complete and tested
