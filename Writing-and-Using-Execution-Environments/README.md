<div align="center">

# 📦 Ansible Execution Environment Workflow with `ansible-builder`

### Definition Files, Dependency Management, Dev/Prod Variants & Validation Testing

![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![CentOS](https://img.shields.io/badge/CentOS%20Stream%209-262577?style=for-the-badge&logo=centos&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Automation Platform](https://img.shields.io/badge/Automation%20Platform-EE0000?style=for-the-badge&logo=redhat&logoColor=white)

![Level](https://img.shields.io/badge/Level-Advanced-red?style=for-the-badge)
![Type](https://img.shields.io/badge/Type-Conclusion-green?style=for-the-badge)

</div>

---

## 📑 Table of Contents

- [🎯 Lab Summary](#-lab-summary)
- [🛠️ Key Skills Practiced](#️-key-skills-practiced)
- [🔑 Key Concepts](#-key-concepts)
- [🌍 Real-World Applications](#-real-world-applications)

---

## 🎯 Lab Summary

> 🧪 **Lab Environment:** `ansible-builder` with the publicly available `quay.io/centos/centos:stream9` base image, Docker, and `ansible-runner`.

In this lab you built a complete Ansible execution environment workflow from the ground up, starting with a definition file based on the publicly available `quay.io/centos/centos:stream9` image and progressing through Python, system, and collection dependency management with `ansible-builder`. You verified the resulting image by running functional test playbooks both directly with Docker and through `ansible-runner`, then extended the workflow by building separate development and production variants to see how build steps affect image size and content. Finally, you created validation and performance testing scripts that exercise the execution environment and produce concrete, checkable output confirming the environment behaves correctly under load.

| 🏷️ Item | 📋 Details |
|---|---|
| **Base Image** | `quay.io/centos/centos:stream9` |
| **Build Tool** | `ansible-builder` |
| **Dependencies** | Python, system, and collection |
| **Verification** | Functional test playbooks run with Docker directly and through `ansible-runner` |
| **Variants** | Separate development and production builds |
| **Testing** | Validation and performance testing scripts with checkable output |

---

## 🛠️ Key Skills Practiced

| # | 🏆 Skill | 📝 Description |
|---|---|---|
| 1 | 📄 **Definition File Authoring** | Started with a definition file based on the `quay.io/centos/centos:stream9` image |
| 2 | 📚 **Dependency Management** | Managed Python, system, and collection dependencies with `ansible-builder` |
| 3 | ✅ **Image Verification** | Ran functional test playbooks directly with Docker and through `ansible-runner` |
| 4 | 🔀 **Dev/Prod Variants** | Built separate development and production variants to see how build steps affect image size and content |
| 5 | 📈 **Validation & Performance Testing** | Created scripts that exercise the execution environment and produce concrete, checkable output confirming correct behavior under load |

---

## 🔑 Key Concepts

| 📌 Term | 📖 Meaning |
|---|---|
| **Execution Environment** | A container image packaging Ansible and its dependencies for running automation |
| **Definition File** | The file `ansible-builder` uses to describe how the image is built |
| **`ansible-builder`** | Tool that builds execution environment images from a definition file |
| **`ansible-runner`** | Tool used to run test playbooks against the built image |
| **Python / System / Collection Dependencies** | The three dependency types managed during the build |
| **Development vs. Production Variant** | Separate builds whose build steps affect image size and content |
| **Validation & Performance Scripts** | Scripts that produce checkable output confirming behavior under load |
| **Tagging Strategies** | Approaches to labeling image versions |
| **Private Registry** | A registry for hosting execution environment images internally |

---

## 🌍 Real-World Applications

With these skills, you are prepared to design, build, and maintain execution environments for real Ansible Automation Platform deployments, including tagging strategies, private registries, and environment-specific dependency sets for larger automation projects.

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Al%20Nafi-Cybersecurity%20Education-0A66C2?style=for-the-badge)

**Made with ❤️ by Al Nafi**

</div><div align="center">

# 📦 Ansible Execution Environment Workflow with `ansible-builder`

### Definition Files, Dependency Management, Dev/Prod Variants & Validation Testing

![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![CentOS](https://img.shields.io/badge/CentOS%20Stream%209-262577?style=for-the-badge&logo=centos&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Automation Platform](https://img.shields.io/badge/Automation%20Platform-EE0000?style=for-the-badge&logo=redhat&logoColor=white)

![Level](https://img.shields.io/badge/Level-Advanced-red?style=for-the-badge)
![Type](https://img.shields.io/badge/Type-Conclusion-green?style=for-the-badge)

</div>

---

## 📑 Table of Contents

- [🎯 Lab Summary](#-lab-summary)
- [🛠️ Key Skills Practiced](#️-key-skills-practiced)
- [🔑 Key Concepts](#-key-concepts)
- [🌍 Real-World Applications](#-real-world-applications)

---

## 🎯 Lab Summary

> 🧪 **Lab Environment:** `ansible-builder` with the publicly available `quay.io/centos/centos:stream9` base image, Docker, and `ansible-runner`.

In this lab you built a complete Ansible execution environment workflow from the ground up, starting with a definition file based on the publicly available `quay.io/centos/centos:stream9` image and progressing through Python, system, and collection dependency management with `ansible-builder`. You verified the resulting image by running functional test playbooks both directly with Docker and through `ansible-runner`, then extended the workflow by building separate development and production variants to see how build steps affect image size and content. Finally, you created validation and performance testing scripts that exercise the execution environment and produce concrete, checkable output confirming the environment behaves correctly under load.

| 🏷️ Item | 📋 Details |
|---|---|
| **Base Image** | `quay.io/centos/centos:stream9` |
| **Build Tool** | `ansible-builder` |
| **Dependencies** | Python, system, and collection |
| **Verification** | Functional test playbooks run with Docker directly and through `ansible-runner` |
| **Variants** | Separate development and production builds |
| **Testing** | Validation and performance testing scripts with checkable output |

---

## 🛠️ Key Skills Practiced

| # | 🏆 Skill | 📝 Description |
|---|---|---|
| 1 | 📄 **Definition File Authoring** | Started with a definition file based on the `quay.io/centos/centos:stream9` image |
| 2 | 📚 **Dependency Management** | Managed Python, system, and collection dependencies with `ansible-builder` |
| 3 | ✅ **Image Verification** | Ran functional test playbooks directly with Docker and through `ansible-runner` |
| 4 | 🔀 **Dev/Prod Variants** | Built separate development and production variants to see how build steps affect image size and content |
| 5 | 📈 **Validation & Performance Testing** | Created scripts that exercise the execution environment and produce concrete, checkable output confirming correct behavior under load |

---

## 🔑 Key Concepts

| 📌 Term | 📖 Meaning |
|---|---|
| **Execution Environment** | A container image packaging Ansible and its dependencies for running automation |
| **Definition File** | The file `ansible-builder` uses to describe how the image is built |
| **`ansible-builder`** | Tool that builds execution environment images from a definition file |
| **`ansible-runner`** | Tool used to run test playbooks against the built image |
| **Python / System / Collection Dependencies** | The three dependency types managed during the build |
| **Development vs. Production Variant** | Separate builds whose build steps affect image size and content |
| **Validation & Performance Scripts** | Scripts that produce checkable output confirming behavior under load |
| **Tagging Strategies** | Approaches to labeling image versions |
| **Private Registry** | A registry for hosting execution environment images internally |

---

## 🌍 Real-World Applications

With these skills, you are prepared to design, build, and maintain execution environments for real Ansible Automation Platform deployments, including tagging strategies, private registries, and environment-specific dependency sets for larger automation projects.

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Al%20Nafi-Cybersecurity%20Education-0A66C2?style=for-the-badge)

**Made with ❤️ by Al Nafi**

</div>
