# AI Usage Log (LOGAI.md) - Lab 5 (StudentHub App)

* **Student Name:** Daiyanti anak Juit
* **Matric Number:** 103756
* **Group:** Team 09 (TMF3084 Lab 5.1)
* **Feature Developed:** Profile and About Page (`profile_about_page.dart`)

---

## 1. Overview of AI Tools Used
During this lab, **Gemini Pro** was utilized exclusively as the primary AI productivity platform for architectural brainstorming, UI layout structuring, code generation, and live debugging.

* **Gemini Pro:** Provided comprehensive support across the entire software development lifecycle—from designing custom widget trees (such as `Stack`, `Container`, and `CircleAvatar` for layered headers) to resolving compilation and positioning bugs.

---

## 2. Summary of AI Prompts & Responses

### Prompt 1: UI Layout Structure for Profile Header
* **Tool:** Gemini Pro
* **Prompt:** *"How do I create a layered profile header in Flutter using a Stack widget where a profile avatar overlaps a colored container banner?"*
* **AI Output:** Provided clean, well-structured Dart code utilizing `SizedBox`, `Stack`, `Container`, and a `Positioned` widget with `MediaQuery` to accurately center the `CircleAvatar`.
* **Integration Decision:** Adopted the proposed widget architecture and adjusted the positioning calculation (`MediaQuery.of(context).size.width / 2 - 50`) to cleanly align the developer details card.

### Prompt 2: Debugging Layout Positioning & Syntax
* **Tool:** Gemini Pro
* **Prompt:** *"Fix this error in my Positioned widget where the left property calculation has a syntax break: left: MediaQuery.of(context).size.width / 2 50"*
* **AI Output:** Pinpointed the missing minus sign and supplied the corrected code snippet (`- 50`).
* **Integration Decision:** Immediately applied the correction to ensure seamless compilation and clean execution.

---

## 3. Reflection on AI-Assisted Development
* **Efficiency & Workflow:** Using Gemini Pro stream-lined code implementation, allowing for rapid iteration on Flutter layout constraints and responsive design patterns.
* **Problem Solving:** Interactive troubleshooting helped quickly resolve syntax errors and understand proper widget hierarchy management within a collaborative project environment.