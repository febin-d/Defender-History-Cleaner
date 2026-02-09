# 🛡️ Defender History Cleaner

A simple and safe Windows utility to clear **Microsoft Defender Protection History** using administrative permissions.

This tool helps remove old or stuck protection history entries that remain even after threats are resolved.

---

## ✨ Features

- Clears Microsoft Defender Protection History
- Uses official Windows directories only
- Lightweight and fast
- No Defender disabling or bypassing
- Open-source and transparent

---

## ⚠️ Requirements

- Windows 10 / Windows 11
- **Administrator privileges** (mandatory)

> Microsoft Defender stores protection history in protected system folders.  
> Running as Administrator is required to safely access and clear these files.

---

## 🚀 How to Use

1. Download or clone this repository
2. Right-click the file and select **Run as administrator**
3. The tool will clear Defender Protection History
4. When prompted:
5. Press **Y** and hit **Enter** to restart  
(Restart is required for changes to fully apply)

---

## 🔄 Why Restart Is Required

Some Defender services keep files locked while Windows is running.  
A system restart ensures:
- All Defender services reload correctly
- Protection History is fully refreshed
- No leftover cached entries remain

---

## 🔐 Security & Safety Notes

- ❌ Does NOT disable Microsoft Defender
- ❌ Does NOT bypass real-time protection
- ❌ Does NOT modify registry security policies
- ✅ Only removes Protection History logs
- ✅ Uses standard Windows commands

This tool is intended for **maintenance and cleanup only**.

---

## 📸 Screenshots (Optional)

_Add screenshots here if you want_

---

## 📜 License

MIT License – free to use, modify, and distribute.

---

## 🙋‍♂️ Author

**Febin Daniel**  
B.Tech CSE | Cybersecurity Enthusiast  

GitHub: https://github.com/your-username

---

## ⭐ Disclaimer

Use this tool responsibly.  
The author is not responsible for misuse or unintended consequences.
