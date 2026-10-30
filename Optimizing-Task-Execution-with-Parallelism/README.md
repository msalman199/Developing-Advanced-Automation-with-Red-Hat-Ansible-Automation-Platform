<div align="center">

# ⚡ Ansible Parallel Execution Strategies & Performance Tuning

### Forks, `free` Strategy, Async Tasks, Trustworthy Timing & Race-Condition Fixes

![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white)
![YAML](https://img.shields.io/badge/YAML-CB171E?style=for-the-badge&logo=yaml&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

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

> 🧪 **Lab Environment:** Ansible playbooks run against an identical workload under several execution strategies, measured with an external timing harness.

In this lab, students moved from a naive sequential Ansible baseline to multiple parallel execution strategies, including increased forks with the `linear` strategy, the `free` strategy, and asynchronous task execution, applying each to an identical workload for a fair comparison. Students then built a timing harness that measures elapsed wall-clock time from outside the playbook using the shell `time` command rather than relying on in-playbook fact timestamps, producing trustworthy improvement percentages instead of misleading ones. Finally, students reproduced a real race condition caused by unsynchronized concurrent writes under the `free` strategy and resolved it using `throttle: 1`, verifying the fix by fetching and inspecting the shared file with correctly formed `ansible` ad hoc commands.

| 🏷️ Item | 📋 Details |
|---|---|
| **Baseline** | Naive sequential Ansible playbook |
| **Strategies Compared** | Increased forks with `linear`, `free`, and asynchronous task execution |
| **Measurement** | External shell `time` command, not in-playbook fact timestamps |
| **Problem Reproduced** | Race condition from unsynchronized concurrent writes under `free` |
| **Fix** | `throttle: 1`, verified via `ansible` ad hoc commands |

---

## 🛠️ Key Skills Practiced

| # | 🏆 Skill | 📝 Description |
|---|---|---|
| 1 | 🐢 **Sequential Baseline** | Started from a naive sequential playbook as the comparison point |
| 2 | 🚀 **Parallel Execution Strategies** | Applied increased forks with `linear`, the `free` strategy, and asynchronous task execution to an identical workload for a fair comparison |
| 3 | ⏱️ **Trustworthy Timing Harness** | Measured elapsed wall-clock time from outside the playbook with the shell `time` command, producing trustworthy improvement percentages instead of misleading ones |
| 4 | 🏁 **Race-Condition Reproduction** | Reproduced a real race condition caused by unsynchronized concurrent writes under the `free` strategy |
| 5 | 🔒 **Throttle-Based Fix & Verification** | Resolved the race with `throttle: 1` and verified the fix by fetching and inspecting the shared file with correctly formed `ansible` ad hoc commands |

---

## 🔑 Key Concepts

| 📌 Term | 📖 Meaning |
|---|---|
| **Forks** | Number of hosts Ansible works on in parallel |
| **`linear` Strategy** | Default strategy; each task completes on all hosts before the next begins |
| **`free` Strategy** | Each host proceeds through tasks independently without waiting for others |
| **Asynchronous Task Execution** | Running tasks without blocking on their completion |
| **Timing Harness** | A measurement setup that times runs from outside the automation tool |
| **Wall-Clock Time** | Real elapsed time, measured here with the shell `time` command |
| **Race Condition** | Incorrect results from unsynchronized concurrent writes to a shared resource |
| **`throttle: 1`** | Limits a task to one host at a time, serializing access to shared resources |
| **Ad Hoc Commands** | One-off `ansible` commands used to fetch and inspect the shared file |

---

## 🌍 Real-World Applications

Going forward, students should apply this same rigor, measuring outside the automation tool and validating shared-resource access, whenever tuning parallelism in production Ansible environments.

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Al%20Nafi-Cybersecurity%20Education-0A66C2?style=for-the-badge)

**Made with ❤️ by Al Nafi**

</div>
