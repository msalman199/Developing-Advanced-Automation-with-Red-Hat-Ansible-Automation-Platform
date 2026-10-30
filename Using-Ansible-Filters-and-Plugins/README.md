<div align="center">

# 🧩 Ansible Custom Filters & Plugins

### Filter Demonstrations, Custom Filter/Lookup/Callback Plugins & an Infrastructure Reporting Playbook

![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Jinja2](https://img.shields.io/badge/Jinja2-B41717?style=for-the-badge&logo=jinja&logoColor=white)
![JSON](https://img.shields.io/badge/JSON-000000?style=for-the-badge&logo=json&logoColor=white)
![YAML](https://img.shields.io/badge/YAML-CB171E?style=for-the-badge&logo=yaml&logoColor=white)

![Level](https://img.shields.io/badge/Level-Advanced-red?style=for-the-badge)
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

> 🧪 **Lab Environment:** Ansible with Jinja2 filters and custom Python plugins (filter, lookup, and callback), combined in a single infrastructure reporting playbook.

In this lab you built a complete working set of Ansible filters and plugins: string, list, dictionary, date, and math filter demonstrations; a custom filter module providing string reversal, numeric extraction, percentage calculation, and byte formatting; a custom lookup plugin for reading JSON data; and a custom callback plugin for detailed execution logging. You then combined all of these into a single infrastructure reporting playbook that loaded external data, computed summary statistics, and raised threshold-based alerts, and you finished by writing a diagnostic playbook to verify filter behavior directly.

| 🏷️ Item | 📋 Details |
|---|---|
| **Built-in Filter Demos** | String, list, dictionary, date, and math filters |
| **Custom Filter Module** | String reversal, numeric extraction, percentage calculation, byte formatting |
| **Custom Lookup Plugin** | Reads JSON data |
| **Custom Callback Plugin** | Detailed execution logging |
| **Combined Playbook** | Infrastructure reporting: external data, summary statistics, threshold-based alerts |
| **Verification** | Diagnostic playbook that tests filter behavior directly |

---

## 🛠️ Key Skills Practiced

| # | 🏆 Skill | 📝 Description |
|---|---|---|
| 1 | 🔤 **Built-in Filter Usage** | Demonstrated string, list, dictionary, date, and math filters |
| 2 | 🧰 **Custom Filter Module** | Wrote custom filters for string reversal, numeric extraction, percentage calculation, and byte formatting |
| 3 | 🔎 **Custom Lookup Plugin** | Built a lookup plugin for reading JSON data |
| 4 | 📝 **Custom Callback Plugin** | Built a callback plugin for detailed execution logging |
| 5 | 📊 **Infrastructure Reporting Playbook** | Combined all components to load external data, compute summary statistics, and raise threshold-based alerts |
| 6 | 🩺 **Diagnostic Playbook** | Verified filter behavior directly with a dedicated diagnostic playbook |

---

## 🔑 Key Concepts

| 📌 Term | 📖 Meaning |
|---|---|
| **Jinja2 Filter** | A transformation applied to data inside templates and playbooks |
| **Custom Filter Module** | A Python module that adds your own filters to Ansible |
| **Lookup Plugin** | A plugin that retrieves data from an external source, here JSON |
| **Callback Plugin** | A plugin that hooks into execution events, here for detailed logging |
| **Threshold-Based Alert** | An alert raised when a computed value crosses a defined limit |
| **Summary Statistics** | Aggregated values computed from loaded external data |
| **Filter Chaining** | Combining multiple filters in sequence |
| **Plugin APIs** | The interfaces Ansible provides for writing plugins |
| **Ansible Collection** | A packaging format for reusing custom plugins across projects |

---

## 🌍 Real-World Applications

Through this process you practiced extending Ansible's Jinja2-based templating with custom Python logic, a core skill for building maintainable, data-driven automation.

---

## 🚀 Next Steps

1. 📖 Explore the official Ansible documentation on writing plugins
2. 📖 Read the Jinja2 Template Designer documentation to deepen your understanding of filter chaining and plugin APIs
3. 📦 Package your custom plugins into an Ansible Collection for reuse across projects

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Al%20Nafi-Cybersecurity%20Education-0A66C2?style=for-the-badge)

**Made with ❤️ by Al Nafi**

</div>
