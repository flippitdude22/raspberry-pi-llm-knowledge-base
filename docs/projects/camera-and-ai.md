# Camera and AI Workloads

Sources:

- Camera software docs: https://www.raspberrypi.com/documentation/computers/camera_software.html
- AI software docs: https://www.raspberrypi.com/documentation/computers/ai.html
- AI Kit and AI HAT docs are linked from the Raspberry Pi accessories documentation.

## Current Camera Stack

Use `rpicam-*` tools on current Raspberry Pi OS:

```bash
rpicam-hello --list-cameras
rpicam-hello -t 5000
rpicam-still -o image.jpg
rpicam-vid -t 10000 -o video.h264
```

Legacy `raspistill` and `raspivid` assumptions should not be the default for new answers.

## Camera Troubleshooting

Check:

```bash
rpicam-hello --list-cameras
v4l2-ctl --list-devices
dmesg -T | grep -Ei 'camera|imx|ov|unicam|csi'
```

Common causes:

- FFC cable reversed or not fully seated.
- Wrong cable pitch/connector for the board.
- Unsupported camera module or sensor overlay.
- Old OS image or stale camera stack.
- Insufficient power or thermal throttling during capture.

## AI Workload Planning

Ask:

- Raspberry Pi model and RAM.
- Accelerator: none, AI Kit, AI HAT, AI HAT+, USB accelerator, or other.
- Workload type: detection, classification, segmentation, OCR, speech, LLM.
- Required FPS, latency, resolution, and power budget.
- Whether the pipeline must run offline.

## Pi 5 AI Notes

Pi 5 is the realistic Raspberry Pi baseline for heavy camera and AI work. Use:

- Active cooling for sustained loads.
- Fast storage for datasets, video, and logs.
- A stable 5 V power supply.
- Accelerator-specific examples where available.

## LLM Guidance

For CPU-only LLMs:

- Recommend small quantized models.
- Set expectations around low token throughput.
- Avoid claiming GPU-class performance.
- Mention memory pressure and swap behavior.

For AI HAT/HAT+:

- Use official examples and model zoo guidance.
- Confirm the exact Hailo device variant and TOPS rating before recommending packages or models.
