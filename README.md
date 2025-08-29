# InfoSeek 🛡️

![Ruby](https://img.shields.io/badge/Ruby-3.1-red.svg) 

![Rails](https://img.shields.io/badge/Rails-7.0-green.svg) 

![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg) 

![License](https://img.shields.io/badge/License-MIT-blue.svg)

> A cinematic network security agent powered by NetScope.

---

## 🚀 Features

- Port scanning
- WHOIS lookup
- DNS enumeration
- SSL analysis
- Vulnerability scanning

---

## 📁 Project Structure

```

InfoSeek/
├── app/
│   ├── services/
│   │   └── netscope/
│   │       ├── port\_scanner.rb
│   │       ├── whois\_lookup.rb
│   │       ├── dns\_enum.rb
│   │       ├── ssl\_analyzer.rb
│   │       └── vuln\_scanner.rb
│   ├── models/
│   │   └── scan\_result.rb
│   └── controllers/
│       └── scans\_controller.rb
├── config/
│   └── routes.rb
├── db/
│   └── migrate/
├── Dockerfile
├── README.md
└── .env

````

---

## 📦 Getting Started

### Prerequisites

- Ruby 3.1+
- Rails 7.0+
- Docker (optional, for containerized deployment)
- Bundler (`gem install bundler`)

---

### Clone the repository

```bash
git clone https://github.com/onelastai/InfoSeek.git
cd InfoSeek
````

---

### Setup the project

```bash
bundle install
rails db:create db:migrate
```

---

### Running locally

```bash
rails server
```

Open your browser or use API clients (Postman/curl) to access:

```
POST http://localhost:3000/scan
Body params: scan_type (port, whois, dns, ssl, vuln), target (domain or IP)
```

Example with curl:

```bash
curl -X POST http://localhost:3000/scan -d "scan_type=port" -d "target=scanme.nmap.org"
```

---

### Using Docker

Build and run with Docker:

```bash
docker build -t infoseek-agent .
docker run -p 3000:3000 --env-file .env infoseek-agent
```


## 🛠️ API Endpoints

| Endpoint | Method | Description                  |
| -------- | ------ | ---------------------------- |
| `/scan`  | POST   | Run specified scan on target |

Request params:

* `scan_type`: `port`, `whois`, `dns`, `ssl`, `vuln`
* `target`: domain or IP address

---

## 🙌 Contributing

Contributions are welcome! Please fork the repo and create a PR with your improvements.


## 📄 License

This project is licensed under the MIT License.
---
## 🌍 Project Info

Website: 🌐 [www.onelastai.com](https://www.onelastai.com)
GitHub Org: 👑 [onelastai](https://github.com/onelastai)
Profile: 👤 onelastai
Patreon: ❤️ [OneLastAI](https://www.patreon.com/onelastai)
Email: ✉️ [info@OneLastAI.com](mailto:info@OneLastAI.com)
Telegram: 💬 [@onelastai](https://t.me/onelastai)

👨‍👨‍👧‍👦 Team Grand Pa United
---
Built proudly across: 🇦🇪 United Arab Emirates • 🇬🇧 United Kingdom • 🇺🇸 United States of America
---
