# GameSpice Flashlight

A player-carried, replicated spot light. Read the family [CLAUDE.md](../../CLAUDE.md) first. **The distributable is `addons/gs_flashlight/`**; it requires [GameSpice Core](../gs-core) only (`ln -s ../../gs-core/addons/gs_core addons/gs_core`, gitignored).

| Path | What |
| --- | --- |
| `core/gs_flashlight_config.gd` | `GSFlashlightConfig`: every tunable, `from_files()`, `local_shadows()` (platform rule) |
| `core/gs_flashlight_rules.gd` | pure decisions: allowed map, dark map, start state, battery step, flicker, nearest N |
| `runtime/gs_flashlight.gd` | `GSFlashlight`: state, battery, local beam, click; authoritative or a client that asks |
| `runtime/gs_flashlight_crowd.gd` | `GSFlashlightCrowd`: everyone else's beams, ranked by distance |
| `runtime/gs_flashlight_beam.gd` | the one place a beam is built and styled |
| `examples/flashlight_selftest.tscn` | the suite (7 sections, 77 checks); `flashlight_demo.tscn` and `tools/screenshot.sh` render a frame |

- **Clicks**: `GSFlashlightClick` plays the on/off pair in 3D (`click_volume` 0 is silent, `click_pitch_jitter`); the stock pair is GameSpice Audio's `flashlight_on/off`, replaceable by defining the same ids first.
- **No autoloads, no scene paths**: the host is a `GSNodeRef`, the audio manager is a `GSNodeRef` and duck-typed (`play`, `catalogue.has`).
- **The server owns on/off.** A client shows its own switch at once, emits `switch_requested`, and takes the server's `apply_state` silently.
- **Game rules stay in the game**: what a lit beam means to NPCs is the game's; this addon only holds the state.
- **Validate**: `--import`, parse every `.gd`, run the suite.
