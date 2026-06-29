# Raspberry Pi LLM Knowledge Base

Curated Raspberry Pi knowledge for LLM ingestion, RAG, agent tools, and MCP-style retrieval.

The purpose of this repository is to give an LLM a reliable local source for Raspberry Pi questions: hardware capabilities, Raspberry Pi OS configuration, GPIO, networking, boot, storage, camera, AI accelerator, troubleshooting, scripts, and practical project patterns.

## Accuracy Rules for Agents

When an LLM uses this repo, it should:

1. Prefer official Raspberry Pi documentation facts over blogs, forum memory, or model recall.
2. Use BCM GPIO numbering unless a table explicitly says physical pin number.
3. Treat `/boot/firmware/config.txt` as the current Raspberry Pi OS Bookworm and later boot config path.
4. Verify model-specific behavior before suggesting overlays, power limits, PCIe, camera connectors, or bootloader settings.
5. Say when information is missing or hardware-dependent instead of guessing.
6. Ask for board model, OS release, power supply, storage media, and exact symptoms for troubleshooting.

## Repository Structure

```text
docs/
  commands/                 Fast command references
  configuration/            config.txt, raspi-config, networking, security
  gpio/                     40-pin header and interfaces
  hardware/                 Board-specific hardware notes
  os/                       Raspberry Pi OS, Kali, package and service workflows
  projects/                 Common use cases and project templates
  storage/                  SD, USB, NVMe, boot order, filesystem guidance
  troubleshooting/          Symptom-driven runbooks
mcp/
  index.json                Retrieval manifest for MCP/RAG importers
  agent-instructions.md     System prompt and retrieval contract
scripts/
  collect-pi-diagnostics.sh Safe diagnostic bundle script for a running Pi
```

## Best Entry Points

- Start with [mcp/agent-instructions.md](mcp/agent-instructions.md) for how an LLM should use this repo.
- Use [mcp/index.json](mcp/index.json) as a machine-readable map of topics, tags, and source authority.
- Use [docs/commands/raspberry-pi-command-reference.md](docs/commands/raspberry-pi-command-reference.md) for quick shell commands.
- Use [docs/troubleshooting/boot-power-network-display.md](docs/troubleshooting/boot-power-network-display.md) for field troubleshooting.

## Primary Sources

- Raspberry Pi computer documentation: https://www.raspberrypi.com/documentation/computers/
- Raspberry Pi documentation source: https://github.com/raspberrypi/documentation
- Raspberry Pi OS docs: https://www.raspberrypi.com/documentation/computers/os.html
- Raspberry Pi configuration docs: https://www.raspberrypi.com/documentation/computers/configuration.html
- Raspberry Pi hardware docs: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html

## Update Process

1. Check official documentation for changed behavior before updating facts.
2. Add source URLs to every new knowledge file.
3. Keep commands copy-pasteable and mark destructive commands clearly.
4. Run `scripts/collect-pi-diagnostics.sh` on real hardware when diagnosing.
5. Keep personal project notes separate from official facts.

## License and Attribution

This repository summarizes and organizes Raspberry Pi knowledge with attribution to Raspberry Pi Ltd documentation. Official Raspberry Pi documentation is the authority for specifications and configuration details. Check the linked source pages for current license terms and updates.
