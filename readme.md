
## 🧠 100-Day MAL Project: A Journey Through Malware Development & Analysis

**Author:** RicheByte  
**License:** MIT (Educational Use Only)  
**Duration:** 100 Days  
**Status:** Ongoing  
**Platform:** Windows (x86/x64), C/C++, Iso, Android,Mac, Linux 
---


# The Code That Watched You Sleep (and Sold Your Secrets)

**Why a Few Lines of Malicious Code Are More Dangerous Than You Think**

Ever feel like someone’s lookin over your shoulder when you’re online? Like, you searched for cat food *once* and now your entire internet is just... cats? It’s not just you. **Tiny bits of code you don't even see are working behind the scenes, learning everything about you.**

We all click around, sign up, download stuff. Seems harmless, right? You trust the sites, the apps. But what if just a *handful* of characters, a few lines of text, could open the door to your private world?

See, we built this thing, **ProjectMal100**. Don't freak out, it's not to *do* bad stuff. It’s to *show* you how easily bad stuff *can* happen. **It’s like showing you a picture of a dangerous spider so you know to look out for it.**

A tiny script, maybe just 100 lines or even less, can do wild things. It can grab info you type. It can see what sites you visit. It can follow you around the internet. **Your digital footprint suddenly looks like a neon sign flashing "MINE YOUR DATA HERE!"**

Think of your phone or computer like your house. You lock the front door, right? Maybe lock the windows too. But what if there was this tiny, almost invisible crack in the wall that someone could peek through? Or worse, slip a key through? That's what some code can do. **It finds the little cracks you never knew were there.**

This is why you gotta be smart. **Don't just blindly trust everything you see or click.** Question it. Ask yourself: "Why does this app need access to my photos?" "Why is this website asking for *all* my info?"

It's not about being scared of the internet. It's about being aware. **Think of it as putting on your digital street smarts.**

We put the code examples in this repo so you can see for yourself, if you know how to look. **Again, this is for learning, for understanding the risks.** See how simple it can be to write something that feels harmless but could be used for not-so-good things.

### How to Stay Safe, For Real

* **Think Before You Click:** Links in emails? Messages from strangers? **Stop. Think. Is it real?**
* **Check App Permissions:** Does that game really need to know your location 24/7? **Probably not.**
* **Use Strong Passwords:** Don't be lazy here. **Mix it up.**
* **Keep Software Updated:** Those updates fix the little cracks. **Install them.**
* **Be Careful What You Share:** Once it's online, it's kinda... everywhere. **Guard your private stuff.**

Look, technology is amazing. It connects us, builds things, makes life easier. **That's the 'light of the world' part.** Using it for good, for building cool stuff, for helping people – that's the goal.

But like any powerful tool, it can be misused. Our job, if we want a better world, is to understand how it works, the good and the bad, and to use our knowledge to protect ourselves and help others understand too. **Being aware is the first step to being safe.**

This repo is a small piece of that understanding. **Use it to learn, to question, to become more aware.** Share what you learn with others. Help shine a light on the dark corners of the internet.

Stay safe out there. If you wanna chat more about this stuff, find me on LinkedIn.

> "The price of anything is the amount of life you exchange for it." - Henry David Thoreau

---

### 🚨 DISCLAIMER

# ⚠️ Disclaimer

This repository is intended for **educational and research purposes only**.

It contains samples of malware and exploitation techniques to help students, analysts, and researchers understand how threats work at a low level.

**Do not** run any of these samples on physical systems. Use **isolated virtual environments** only.  
Misuse of this repository may be illegal and unethical.

By using this code, you agree to take full responsibility for how it is used.


---

### 🎯 Project Goals

- Teach core malware development concepts in a responsible and academic way
    
- Demonstrate common evasion, obfuscation, persistence, and payload techniques
    
- Develop 100 different examples ranging from beginner to advanced
    
- Improve reverse engineering and malware analysis skills
    
- Provide cybersecurity awareness and transparency through code
    

---

### 🗂️ Structure

```
100-day-mal-project/
├── Day01_ArmoredVirus/
│   ├── armored_template.c
│   └── README.md
├── Day02_PolymorphicKeylogger/
├── Day03_CodeInjection_PE/
├── ...
├── README.md  ← You're here
└── LICENSE
```

Each folder contains:

- 📄 **Source code (.c/.cpp)**
    
- 📝 **Mini README** explaining the technique used
    
- 🔐 **Safe payload or placeholder**, never destructive code
    
- 💬 Comments explaining every section
    

---

### 🧩 Techniques Covered

- Anti-debugging and sandbox detection
    
- Obfuscation & polymorphism
    
- Process injection (classic, reflective, DLL)
    
- Fileless execution (memory-only)
    
- Keylogging, hooking, and shellcode loaders
    
- Evasion tactics used in real-world malware
    
- Persistence methods (registry, services, startup tasks)
    
- Command-and-control (simulated for research only)
    
- Cryptographic misuse in malware
    
- Packers and custom encryption
    

> 📚 This is a **library of malware behavior**, not a library of threats.

---

### 🧪 How to Run (Education Only)

- Use inside **VMs only** (VirtualBox/VMware)
    
- Do **NOT** run on production or personal machines
    
- Use tools like:
    
    - x64dbg / OllyDbg (debugging)
        
    - Procmon / Process Hacker (monitoring)
        
    - Wireshark / Fiddler (network behavior)
        
    - Ghidra / IDA Free (reverse engineering)
        

---

### 🔐 License

This project is released under the [MIT License]().  
**Use for educational and ethical hacking purposes only.**

---

### ❤️ Contributions

- Want to add a sample?
    
- Suggest a modern malware technique?
    
- Help rewrite for better documentation?
    

> PRs are welcome — as long as they follow the **educational intent** of the project.

---

### 📢 Final Word

> “Know your enemy and know yourself, and you need not fear the result of a hundred battles.”  
> – _Sun Tzu, The Art of War_

In a world full of cyber threats, **understanding malware is the first step to defeating it**.
