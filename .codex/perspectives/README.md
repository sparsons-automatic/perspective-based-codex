# Codex Perspectives

This folder collects **perspective guides**: focused operating manuals that teach Codex how to embody a specialized reviewer or advisor when answering a prompt. Each markdown file gives Codex a persona, the information sources it can rely on, and the output format it should follow. Pointing Codex at one of these files lets you receive higher-signal answers without rewriting the rules every time.

## Available Perspectives

| Perspective | Intent | When to Use |
| --- | --- | --- |
| [SecurityInvestigator](SecurityInvestigator.md) | Acts as a calm security partner who surfaces risks, clarifies assumptions, and suggests follow-up questions without blocking work. | Ask for a security readout on recent changes, validate threat assumptions, or get a list of open security questions before a release. |
| [ComplianceTranslator](ComplianceTranslator.md) | Converts regulatory language (PCI, NIST, ISO, HIPAA, etc.) into scoped engineering tasks and highlights control overlap for traceability. | When mapping frameworks to actionable todos, deduplicating compliance work, or drafting control-to-task plans. |
| [ProjectManagerNavigator](ProjectManagerNavigator.md) | Maintains holistic project awareness, spots drift in scope or timing, and frames release-readiness decisions. | Use for cadence reports, scope reviews, or deciding whether to cut a release or reshuffle work. |

Each file shares a common structure (Role Identity → Responsibilities → Inputs/Outputs → Output Format → Constraints → Success Criteria) so Codex can rapidly scan for the expectations that matter.

## Building a New Perspective

1. **Clone the structure**  
   Start from one of the existing files and keep the same heading order. Codex performs best when every perspective clearly defines:
   - Role identity and explicit “you are / you are not” statements.
   - Primary responsibilities or playbooks.
   - Allowed inputs and required outputs.
   - A standard response format and example prompts.
   - Hard constraints and success criteria.

2. **Stay specific and operational**  
   Favor concrete responsibilities (“Summarize blast radius and detection paths”) over abstract traits (“Be cautious”). Include signals Codex can actually observe (files, scripts, status summaries) and forbid anything off-limits (running commands, editing code, etc.).

3. **Map to Codex workflows**  
   Reference other repo docs (AGENTS.md, ARCHITECTURE.md, Todo API summaries) so the perspective knows where to look for context. If the role coordinates with another persona, note the hand-off (e.g., ComplianceTranslator defers security judgments to SecurityInvestigator).

4. **Document prompts and scope**  
   Provide example prompts to help future operators quickly re-use the perspective. Call out any prerequisites (branch cleanliness, required artifacts, etc.) so Codex knows when it should decline.

5. **Save as `.codex/perspectives/<Name>.md` and update this README**  
   Add a row to the table above summarizing the new perspective so collaborators can discover it.

## Using Perspectives with Codex

1. **Surface the relevant guide** – When you want Codex to adopt a role, mention the specific file path (e.g., “Use `.codex/perspectives/SecurityInvestigator.md`”) or paste the relevant excerpt into your prompt/context.
2. **Provide matching inputs** – Feed Codex the documents the perspective expects (Todo summaries, architecture notes, git status, etc.) so it can operate inside its constraints.
3. **Ask aligned questions** – Phrase requests using the example prompts or the Standard Output Format outlined in the perspective to nudge Codex toward the intended structure.
4. **Capture outputs as artifacts** – If Codex produces risk lists, compliance mappings, or release-readiness notes, store them alongside the work (e.g., in TODO files or PR descriptions) to build traceability.
5. **Iterate on the guides** – When feedback shows a perspective is too vague or too strict, edit its markdown file and re-run the workflow. Treat these guides as living documentation that evolves with your process.

By keeping perspectives centralized and consistently structured, you enable Codex (and teammates) to switch roles quickly, reuse hard-earned context, and keep project guidance predictable.
