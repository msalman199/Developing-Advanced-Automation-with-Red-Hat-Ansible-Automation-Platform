<div align="center">

# 🐳 Building Ansible Execution Environments

### ansible-builder • ansible-runner • Podman • Production-Grade EEs • Automated Test Suite

![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white)
![Podman](https://img.shields.io/badge/Podman-892CA0?style=for-the-badge&logo=podman&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Containers](https://img.shields.io/badge/Execution-Environments-2496ED?style=for-the-badge&logo=docker&logoColor=white)

</div>

---

## 📑 Table of Contents

- [📋 Lab Summary](#-lab-summary)
- [🛠️ Key Skills Practiced](#️-key-skills-practiced)
- [📚 Key Concepts](#-key-concepts)
- [🔑 Key Takeaway](#-key-takeaway)
- [🏭 Production Best Practices](#-production-best-practices)

---

## 📋 Lab Summary

In this lab, you built **two containerized Ansible Execution Environments** from scratch using `ansible-builder`, defined their dependencies, and validated each image by running real playbooks inside them. You then progressed to a **production-grade Execution Environment** with pinned dependency versions, a hardened build process, and a complete automated test suite, finishing with proper cleanup of all temporary artifacts.

---

## 🛠️ Key Skills Practiced

| # | Skill | Details |
|---|-------|---------|
| 1 | 🏗️ **Building EEs** | Built two containerized Execution Environments from scratch using `ansible-builder` |
| 2 | 📄 **Dependency Definition** | Defined Python, Galaxy, and system dependencies through `requirements.txt`, `requirements.yml`, and `bindep.txt` |
| 3 | ✅ **Image Validation** | Validated each image by running real playbooks inside them with both `ansible-runner` and direct Podman invocations |
| 4 | 🏭 **Production-Grade EE** | Created an EE with pinned dependency versions and a hardened build process |
| 5 | 🧪 **Automated Test Suite** | Ran a complete five-part test suite covering core Ansible functionality, third-party Python modules, Galaxy collections, file operations, and cryptographic operations |
| 6 | 🧹 **Cleanup** | Properly cleaned up all temporary artifacts |

---

## 📚 Key Concepts

| Concept | Description |
|---------|-------------|
| **Execution Environment** | Containerized image bundling Ansible content with its Python, Galaxy, and system dependencies |
| **`ansible-builder`** | Tool that builds Execution Environment images |
| **`requirements.txt`** | Python dependencies |
| **`requirements.yml`** | Galaxy collection dependencies |
| **`bindep.txt`** | System package dependencies |
| **`ansible-runner`** | Runs playbooks inside an Execution Environment |
| **Podman** | Container engine used for direct invocations |
| **Test Suite Playbook** | Dedicated playbook run against every new EE build |

---

## 🔑 Key Takeaway

Execution Environments **decouple automation content from the control node's Python and OS packages**, making playbook runs portable, reproducible, and easy to version.

---

## 🏭 Production Best Practices

For production use, you should always:

- 📌 **Pin dependency versions**
- 📦 **Minimize image size** by cleaning package caches during the build
- 👤 **Run as a non-root user** where possible
- 🧪 **Maintain a dedicated test suite playbook** that you run against every new Execution Environment build before promoting it to your automation pipeline

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Al%20Nafi-Cybersecurity%20Education-0A66C2?style=for-the-badge)

**Created for Al Nafi Training Labs**

</div>
