# Raspberry Pi LLM Knowledge Base

**Curated, high-accuracy Raspberry Pi documentation structured for LLM ingestion, RAG systems, custom AI agents (MCP, Hermes, Claude, etc.), and developer workflows.**

This repository contains clean, organized Markdown files focused on the hardware and configuration you actually use:
- Raspberry Pi 5
- Raspberry Pi Zero 2 W
- GPIO, interfacing, and embedded projects
- Headless / portable / battery-powered setups (PiSugar, etc.)
- Networking for RaspAP, Pwnagotchi, and pentesting APs
- Kali Linux on Raspberry Pi
- Production-line automation and vision QC systems

## Why This Repo Exists
Official Raspberry Pi documentation is excellent but scattered across the web and AsciiDoc sources. LLMs frequently hallucinate pin numbers, power limits, `config.txt` parameters, PCIe behavior, and overlay syntax. This curated set gives your agents ground-truth facts so they generate correct, working configurations and code every time.

**Primary Sources (always verify against these)**
- Official documentation: https://www.raspberrypi.com/documentation/computers/
- Source repository: https://github.com/raspberrypi/documentation (AsciiDoc)

## How to Use With LLMs / RAG / Agents
1. Clone this repo.
2. Load the `docs/` folder (or specific subfolders) into your vector database / embedding pipeline.
3. In your agent system prompts, add:
   > "Always ground answers in the official Raspberry Pi specifications from this knowledge base. Use exact BCM GPIO numbers, `config.txt` parameters, and power requirements. If information is missing, say so and suggest checking the live official docs."
4. For project-specific agents, create small additional Markdown files in a `projects/` folder with your custom wiring diagrams, timing, and notes.

## Repository Structure
```
raspberry-pi-llm-knowledge-base/
├── README.md
├── docs/
│   ├── hardware/
│   │   ├── raspberry-pi-5.md
│   │   └── raspberry-pi-zero-2w.md
│   ├── gpio/
│   │   └── pinout-and-interfacing.md
│   ├── configuration/
│   │   ├── essential-config.md
│   │   └── networking-and-wireless.md
│   └── power-portable.md
└── kali-linux.md
```

## Update Process
This is a curated snapshot. To keep it current:
1. Periodically pull the latest from https://github.com/raspberrypi/documentation
2. Re-generate or manually merge changes into these Markdown files.
3. Or use scripts to convert AsciiDoc → Markdown automatically.

## License & Attribution
Content is derived from the official Raspberry Pi documentation, which is licensed under [CC-BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
This repository follows the same spirit. Please attribute the Raspberry Pi Foundation when sharing.

## Next Steps for Your Workflow
- Feed into your MCP server or Hermes multi-LLM agent.
- Create project-specific subfolders (e.g., `projects/pwnagotchi/`, `projects/vision-qc-line/`).
- Add your custom scripts, wiring notes, and measured power data.

**Goal**: Zero hallucinations on Raspberry Pi hardware facts. Fast, reliable agent-generated configs and code for your cybersecurity, embedded, and automation projects.

---

*Maintained for practical, high-accuracy use in real hardware projects.*