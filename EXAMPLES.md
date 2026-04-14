# Hermes-Agent Skill Examples

Real-world code examples demonstrating the four principles used by the `karpathy-guidelines` Hermes-Agent skill.

Each example shows what coding agents commonly do wrong and what the corrected behavior should look like.

---

## 1. Think Before Coding

### Example 1: Hidden Assumptions

User request: "Add a feature to export user data"

❌ What agents do wrong
- assume it should export all users
- assume file format and destination
- assume which fields are safe to include
- assume scale and performance constraints

✅ Better behavior
- ask whether export means browser download, background job, or API endpoint
- ask which fields are allowed
- ask whether this is all users or a filtered subset
- suggest the simplest valid approach first

### Example 2: Multiple Interpretations

User request: "Make the search faster"

❌ What agents do wrong
- silently choose one optimization path
- implement caching, indexing, and async processing all at once

✅ Better behavior
- separate latency vs throughput vs perceived speed
- state the effort tradeoffs
- ask which outcome matters most

---

## 2. Simplicity First

### Example 1: Over-abstraction

User request: "Add a function to calculate discount"

❌ What agents do wrong
- introduce strategy classes, enums, config objects, and dependency plumbing
- turn a one-function request into a mini framework

✅ Better behavior

```python
def calculate_discount(amount: float, percent: float) -> float:
    return amount * (percent / 100)
```

Only add complexity after the requirement exists.

### Example 2: Speculative features

User request: "Save user preferences to database"

❌ What agents do wrong
- add caching
- add validators nobody asked for
- add merge semantics and notifications

✅ Better behavior

```python
def save_preferences(db, user_id: int, preferences: dict):
    db.execute(
        "UPDATE users SET preferences = ? WHERE id = ?",
        (json.dumps(preferences), user_id),
    )
```

---

## 3. Surgical Changes

### Example 1: Drive-by refactoring

User request: "Fix the bug where empty emails crash the validator"

❌ What agents do wrong
- rewrite adjacent validation logic
- change comments and style
- add unrelated username validation

✅ Better behavior
- fix the empty-email crash only
- add the smallest regression test
- leave unrelated code alone

### Example 2: Cleaning up too much

User request: "Rename method `fetch_data` to `load_data`"

❌ What agents do wrong
- refactor half the module
- remove unrelated helper functions
- rewrite comments for style consistency

✅ Better behavior
- rename the method
- update its call sites
- run tests
- stop

---

## 4. Goal-Driven Execution

### Example 1: Weak imperative task

User request: "Fix the login bug"

❌ Weak execution
- guess at the cause
- patch multiple places
- declare success without a reproducible check

✅ Better execution
1. reproduce the bug with a failing test
2. identify the smallest root-cause fix
3. make the test pass
4. run the broader relevant suite

### Example 2: Strong autonomous loop

User request: "Add CSV import validation"

✅ Better execution framing
1. write tests for malformed CSV rows
2. implement validation until those tests pass
3. verify existing valid-import tests still pass

That gives Hermes-Agent a clean loop with explicit finish conditions.
