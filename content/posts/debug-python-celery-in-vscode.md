---
title: "使用 VSCode 高效调试 Python 项目和 Celery 任务"
description: "如何使用 VSCode 进行 Python 调试，包括异步的 Celery 任务"
author: 3TinyBites
twitter: 3tinybites
date: 2023-03-10
draft: false
tags:
    - "python"
    - "vscode"
    - "celery"
---

对于 Python 开发者来说，调试是必不可少的工作，它能帮助我们快速定位代码中的错误并进行修复。虽然大多数人喜欢使用 PyCharm 这样的 IDE 来调试 Python 代码，但是 VSCode 也是一款非常强大的工具，而且它的使用也变得越来越流行。在本文中，将介绍如何在 VSCode 中配置和使用 Python 调试，以及如何调试 Celery 任务。

为了使用 VSCode 进行 Python 调试，只需要在项目根目录下的 `.vscode` 文件夹中创建一个名为 `launch.json` 的文件，并添加相应的配置。下面就是一个简单的示例，它展示了如何为 FastAPI 项目和 Celery 任务添加调试配置。

```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python: FastAPI",
            "type": "python",
            "request": "launch",
            "module": "uvicorn",
            "args": [
                "main:app"
            ],
            "jinja": true,
            "justMyCode": true
        },
        {
            "name": "Debug Celery Worker",
            "type": "python",
            "request": "launch",
            "module": "celery",
            "args": [
                "-A",
                "worker",
                "worker",
                "-l",
                "debug",
                "-Q",
                "queue",
                "-c",
                "1"
            ],
            "cwd": "${workspaceRoot}",
            "env": {
                "PYTHONPATH": "${workspaceRoot}"
            },
            "console": "integratedTerminal"
        }
    ]
}
```