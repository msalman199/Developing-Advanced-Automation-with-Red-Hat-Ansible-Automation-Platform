<div align="center">

# ☁️ Ansible AWS EC2 Dynamic Inventory

### Discovering Hosts Dynamically, Multi-Play Workflows & Systematic Troubleshooting

![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white)
![YAML](https://img.shields.io/badge/YAML-CB171E?style=for-the-badge&logo=yaml&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

![Level](https://img.shields.io/badge/Level-Intermediate-blue?style=for-the-badge)
![Type](https://img.shields.io/badge/Type-Conclusion-green?style=for-the-badge)

</div>

---

## 📑 Table of Contents

- [🎯 Lab Summary](#-lab-summary)
- [🛠️ Key Skills Practiced](#️-key-skills-practiced)
- [🔑 Key Concepts](#-key-concepts)
- [🌍 Real-World Applications](#-real-world-applications)
- [🚀 Next Steps](#-next-steps)

---

## 🎯 Lab Summary

> 🧪 **Lab Environment:** Ansible with the AWS `aws_ec2` inventory plugin, playbooks driven by dynamically discovered EC2 hosts, and a diagnostic script for troubleshooting.

In this lab you configured and tested an AWS `aws_ec2` dynamic inventory, compared it against a traditional static inventory, and ran playbooks that used dynamically discovered hosts and their EC2 metadata to generate and verify system reports. You built a multi-play deployment workflow with `import_playbook` and confirmed each phase executed and produced verifiable output. You also used a diagnostic script to systematically troubleshoot credential, dependency, and configuration-naming problems, including a deliberately broken file name to see a real failure mode firsthand.

| 🏷️ Item | 📋 Details |
|---|---|
| **Inventory Plugin** | `aws_ec2` dynamic inventory |
| **Comparison** | Dynamic inventory vs. traditional static inventory |
| **Playbooks** | System reports generated and verified from discovered hosts and EC2 metadata |
| **Workflow** | Multi-play deployment using `import_playbook` |
| **Troubleshooting** | Diagnostic script covering credentials, dependencies, and configuration naming |

---

## 🛠️ Key Skills Practiced

| # | 🏆 Skill | 📝 Description |
|---|---|---|
| 1 | ⚙️ **Dynamic Inventory Configuration** | Configured and tested an AWS `aws_ec2` dynamic inventory |
| 2 | ⚖️ **Static vs. Dynamic Comparison** | Compared the dynamic inventory against a traditional static inventory |
| 3 | 📊 **Metadata-Driven Playbooks** | Used dynamically discovered hosts and their EC2 metadata to generate and verify system reports |
| 4 | 🔗 **Multi-Play Workflow** | Built a deployment workflow with `import_playbook` and confirmed each phase produced verifiable output |
| 5 | 🩺 **Systematic Troubleshooting** | Used a diagnostic script to diagnose credential, dependency, and configuration-naming problems, including a deliberately broken file name |

---

## 🔑 Key Concepts

| 📌 Term | 📖 Meaning |
|---|---|
| **Dynamic Inventory** | An inventory built from live infrastructure data rather than a fixed host list |
| **`aws_ec2` Plugin** | The inventory plugin that discovers EC2 instances in AWS |
| **Static Inventory** | A fixed host list that can become stale or incorrect as infrastructure changes |
| **EC2 Metadata** | Instance details discovered alongside each host and used inside playbooks |
| **`import_playbook`** | Directive for chaining multiple plays into one multi-phase workflow |
| **Diagnostic Script** | A script used to systematically check credentials, dependencies, and configuration naming |
| **Configuration Naming** | Inventory plugin files must be named correctly, as the deliberately broken file name demonstrated |

---

## 🌍 Real-World Applications

These skills translate directly to real-world automation work, where infrastructure changes constantly and static host lists quickly become stale or incorrect.

---

## 🚀 Next Steps

1. ☁️ Extend this lab by connecting the same inventory approach to a second cloud provider's equivalent plugin, such as `azure.azcollection.azure_rm` or `google.cloud.gcp_compute`
2. 📈 Integrate the generated system reports into a monitoring or configuration-management pipeline

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Al%20Nafi-Cybersecurity%20Education-0A66C2?style=for-the-badge)

**Made with ❤️ by Al Nafi**

</div>
