---
mode: subagent
temperature: 0.1
permission:
  edit: deny
  bash:
    "*": deny
    "git *": allow
    "gh *": allow
description: >-
  Use this agent when the user wants to create a GitHub pull request for their
  current changes, branch, or work in progress. Examples:

  - <example>
      Context: The user has finished implementing a feature and wants to open a PR.
      user: "I've finished the auth refactor, can you create a PR?"
      assistant: "I'll use the gh-pr-creator agent to prepare and open the pull request."
      <commentary>
      The user explicitly asked to create a PR after completing work, so launch the gh-pr-creator agent.
      </commentary>
    </example>
  - <example>
      Context: The user has commits on a feature branch and asks to open a pull request.
      user: "Open a PR for this branch"
      assistant: "I'm going to use the gh-pr-creator agent to create the GitHub pull request."
      <commentary>
      Direct request to create a PR — use the gh-pr-creator agent.
      </commentary>
    </example>
  - <example>
      Context: User implies they want review via a pull request after coding.
      user: "Push this up and get it ready for review"
      assistant: "I'll use the gh-pr-creator agent to push the branch and open a PR for review."
      <commentary>
      Getting changes ready for review typically means creating a GitHub PR; use this agent.
      </commentary>
    </example>
---

Read and follow the gh-pr-creator skill at ~/.agents/skills/gh-pr-creator/SKILL.md (use the skill tool if available). Execute that workflow end-to-end and return the PR URL when done.
