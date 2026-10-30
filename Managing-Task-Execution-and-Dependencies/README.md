<div align="center">

# 🔀 Ansible Conditionals, Handlers & Error-Handled Deployments

### `when` Clauses, Handlers, `block`/`rescue`/`always` & a Flask Deployment Playbook

![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white)
![YAML](https://img.shields.io/badge/YAML-CB171E?style=for-the-badge&logo=yaml&logoColor=white)
![Flask](https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=flask&logoColor=white)
![Jinja2](https://img.shields.io/badge/Jinja2-B41717?style=for-the-badge&logo=jinja&logoColor=white)
![systemd](https://img.shields.io/badge/systemd-FCC624?style=for-the-badge&logo=linux&logoColor=black)

![Level](https://img.shields.io/badge/Level-Intermediate-blue?style=for-the-badge)
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

> 🧪 **Lab Environment:** Ansible playbooks progressing from conditionals and handlers to error-handled blocks, culminating in a single Flask deployment playbook.

In this lab, you built and ran a series of Ansible playbooks that progressively introduced conditional task execution with `when` clauses, task ordering and dependency management through handlers, and resilient workflows using `block`, `rescue`, and `always`. You then combined these techniques into a single deployment playbook that installed prerequisites, deployed a Flask application as a systemd service, and generated a deployment report using a Jinja2 template. Along the way you practiced diagnosing common real-world issues such as missing privilege escalation and handlers not firing due to unchanged task state.

| 🏷️ Item | 📋 Details |
|---|---|
| **Conditional Execution** | `when` clauses |
| **Ordering & Dependencies** | Handlers |
| **Resilient Workflows** | `block`, `rescue`, and `always` |
| **Combined Playbook** | Prerequisites, Flask app as a systemd service, Jinja2 deployment report |
| **Troubleshooting** | Missing privilege escalation; handlers not firing due to unchanged task state |

---

## 🛠️ Key Skills Practiced

| # | 🏆 Skill | 📝 Description |
|---|---|---|
| 1 | ❓ **Conditional Task Execution** | Used `when` clauses to run tasks only when conditions are met |
| 2 | 🔔 **Handlers & Task Ordering** | Managed task ordering and dependencies through handlers |
| 3 | 🛡️ **Resilient Workflows** | Built error-handled workflows with `block`, `rescue`, and `always` |
| 4 | 🚀 **Combined Deployment** | Installed prerequisites, deployed a Flask application as a systemd service, and generated a deployment report with a Jinja2 template |
| 5 | 🩺 **Real-World Diagnosis** | Diagnosed missing privilege escalation and handlers not firing due to unchanged task state |

---

## 🔑 Key Concepts

| 📌 Term | 📖 Meaning |
|---|---|
| **`when` Clause** | Conditional that controls whether a task runs |
| **Handler** | A task that runs when notified, used for ordered dependencies |
| **Handler Trigger Behavior** | Handlers fire only when the notifying task reports a change, so unchanged task state means no handler run |
| **`block`** | Groups tasks so they can be handled together |
| **`rescue`** | Tasks that run when a task in the `block` fails |
| **`always`** | Tasks that run regardless of success or failure |
| **Privilege Escalation** | Elevated rights required by tasks such as installing packages and managing services |
| **systemd Service** | The method used to run the Flask application |
| **Jinja2 Template** | Used to generate the deployment report |

---

## 🌍 Real-World Applications

These patterns of conditional logic, ordered dependencies, and error-handled blocks are foundational to writing production-grade Ansible automation that can be safely and predictably re-run against live infrastructure.

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Al%20Nafi-Cybersecurity%20Education-0A66C2?style=for-the-badge)

**Made with ❤️ by Al Nafi**

</div>
