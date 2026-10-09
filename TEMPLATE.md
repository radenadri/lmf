# Tutorial: [Feature Name or Bug Fix]

- **Module**: `[module_name]`
- **Target Files**:
  - `path/to/file1.ts`
  - `path/to/file2.ts`
- **Estimated Effort**: [e.g. 15 minutes / 3 steps]

---

## 1. Problem & Context

Explain the current behavior or missing capability. What happens right now, or what requirement needs to be fulfilled?

---

## 2. Root Cause & Technical Explanation

Explain **why** this problem occurs or **why** this architectural change is necessary.
- How the existing code behaves under the hood.
- The underlying mechanism that needs alteration.

---

## 3. Architecture & Design Decisions

Detail the architectural pattern or approach chosen:
- Why this approach over alternatives.
- Trade-offs made (simplicity vs flexibility, performance vs readability).
- Data flow or lifecycle diagram if relevant.

---

## 4. Step-by-Step Implementation Guide

Follow these steps sequentially to implement and own the code.

### Step 1: [Short Action Title, e.g., Define Data Types & Interfaces]
- **Target File**: `path/to/types.ts`
- **Action**: [Create / Modify]

#### Code / Diff
```typescript
// Insert exact code or diff with clear context
export interface ExamplePayload {
  id: string;
  name: string;
}
```

#### Why This Works
Explain the specific logic, type safety guarantees, or side effects introduced here (2-3 concise sentences).

---

### Step 2: [Next Action Title, e.g., Implement Core Business Logic]
- **Target File**: `path/to/service.ts`
- **Action**: [Create / Modify]

#### Code / Diff
```typescript
// Targeted code addition or replacement
```

#### Why This Works
Explain how this integrates with Step 1 and why the implementation handles expected edge cases.

---

## 5. Verification & Testing

Verify your manual implementation with these commands:

### Automated Verification
```bash
# Run unit test or type check
pnpm test path/to/test.spec.ts
pnpm run typecheck
```

### Manual Verification Checklist
- [ ] Action 1: [e.g. Trigger API endpoint with curl]
- [ ] Expected Result: [e.g. Returns 200 OK with payload]
- [ ] Edge Case Check: [e.g. Pass invalid ID and confirm 400 Bad Request]

---

## 6. Common Gotchas & Edge Cases

- **Gotcha 1**: [Describe subtle mistake, e.g., forgetting to re-export in index.ts]
- **Edge Case 2**: [Describe boundary condition, e.g., handling null/undefined payloads]
