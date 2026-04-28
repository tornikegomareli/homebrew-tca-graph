# homebrew-tca-graph

Homebrew tap for [tca-graph](https://github.com/tornikegomareli/tca-graph) — an interactive architecture visualizer and architectural-budget linter for Swift codebases that use The Composable Architecture.

## Install

```bash
brew tap tornikegomareli/tca-graph
brew install tca-graph
```

## Usage

```bash
tca-graph serve ~/Code/MyTCAProject       # opens the interactive viewer in a browser
tca-graph check ~/Code/MyTCAProject       # architectural-budget linter
tca-graph analyze ~/Code/MyTCAProject     # emits the canonical graph as JSON
tca-graph init-budgets ~/Code/MyTCAProject # snapshots current state into .tca-graph.yml
```

See the main repo's [README](https://github.com/tornikegomareli/tca-graph#readme) for the full feature list, configuration format, and Xcode / GitHub Actions integration snippets.

## Updating

```bash
brew update
brew upgrade tca-graph
```

The formula is regenerated for each release of the upstream project.
