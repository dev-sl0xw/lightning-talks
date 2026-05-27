# A/B 실험 결과 — Karpathy CLAUDE.md 4원칙

**모델:** Claude Sonnet 4.6 (`claude-sonnet-4-6`)
**N:** 각 조건당 1회 (총 8회 세션)
**날짜:** 2026-05-27
**조건 A:** CLAUDE.md 없음 (빈 파일)
**조건 B:** `multica-ai/andrej-karpathy-skills`의 CLAUDE.md 그대로 적용
**실행 방식:** 8개 독립 git worktree, 각 worktree에서 Claude Sonnet 4.6 서브에이전트 1회 호출, 동일 프롬프트
**한계:** N=1, 서브에이전트도 Claude이므로 A 조건이 완전한 "guideline-free baseline"은 아님. 그래도 CLAUDE.md를 명시 주입한 B와의 *상대적* 차이는 유효.

---

## 종합 매트릭스

| 태스크 | 원칙 | A: diff +/- | B: diff +/- | A: 명세외 변경 | B: 명세외 변경 | 핵심 차이 |
|---|---|---|---|---|---|---|
| 1-think | 사고 | +8 / -0 | +6 / -0 | 0 | 0 | A는 일반 안전망(타입/None), B는 도메인 의미(동일 계좌) |
| 2-simple | 단순성 | +3 / -0 | +3 / -0 | 0 | 0 | **차이 없음** (베이스라인이 이미 최소) |
| 3-surgical | 외과적 변경 | +1 / -1 | +1 / -1 | 0 | 0 | diff 동일, B만 dead code 발견을 보고 |
| 4-goal | 목표주도 | +1 / -1 | +2 / -1 + 새 파일 1 | 0 | 0 | **A는 코드만 수정, B는 TDD 4단계 완수** |

---

## 원칙별 상세

### Task 1 — 사고 (Think Before Coding)
- 명확화 질문 수: A=0, B=0 (서브에이전트는 user에게 묻기 어려움)
- 추가된 검증 라인 수: A=4, B=3
- 가정 명시: A=yes, B=yes
- 관찰: A는 타입/None 검증을 자동으로 추가했으나 B는 "transfer_funds"의 도메인 의미(자기송금 방지)를 우선. 둘 다 가정 명시.
- **차이:** 미미. Sonnet 4.6 베이스라인이 이미 assumption-stating에 가까움.

### Task 2 — 단순성 (Simplicity First)
- 새 클래스/인터페이스 수: A=0, B=0
- 총 코드 줄 수: A=4, B=4
- 관찰: 두 결과가 100% 동일. `def add_todo(item): todos.append(item)`.
- **차이:** **없음.** Sonnet 4.6은 default가 minimal.

### Task 3 — 외과적 변경 (Surgical Changes)
- 무관 변경 항목 수: A=0, B=0
- diff 변경 줄: A=1, B=1
- 미사용 코드 발견 보고 (삭제 X): A=no, B=yes
- 관찰: 두 diff는 byte-for-byte 동일. 차이는 응답에서 — B만 "`import classnames`가 미사용이지만 의도적으로 두었다"고 보고.
- **차이:** diff 레벨 없음. 메타 행동 (보고)에서만 차이.

### Task 4 — 목표주도 (Goal-Driven Execution) ⭐ Hero Case
- 재현 테스트 작성: A=no, B=**yes** (`test_trap.py` 새로 생성)
- 실패 확인 실행: A=no, B=**yes** (pytest 실패 확인)
- 수정 적용: A=yes, B=yes
- 수정 후 통과 확인 실행: A=no, B=**yes**
- TDD 4단계 완수: A=1/4, B=**4/4**
- **차이:** **극명.** 같은 코드 수정이지만 A는 "고쳤다고 주장", B는 "고쳤음을 증명".

---

## 가장 드라마틱한 사례 — Hero Case (슬라이드 #4)

**Task 4 (목표주도 실행)** 을 hero case로 선정.

이유:
1. 4원칙 중 *유일하게* diff와 행동 모두에서 명확한 차이가 발생.
2. 결과물에 검증 단계의 유무라는 가시적 차이(테스트 파일 신규 생성)가 있음.
3. 발표 청중에게 "왜 모델이 fix만 하고 끝났을 때 위험한지" 직관적으로 어필.

**제시 방식:**
- A는 코드 1줄 수정 후 끝
- B는 동일 코드 수정 + `test_trap.py` 생성 + pytest 실패→통과 확인

---

## 정직한 관찰 — 슬라이드에 반영해야 할 내용

**Sonnet 4.6의 베이스라인은 이미 Karpathy 원칙 1~3에 상당히 정렬되어 있다.** RLHF 학습 과정에서 "assumption stating, simplicity, surgical changes"가 이미 내재화된 것으로 보인다.

**CLAUDE.md의 가장 큰 효과는 원칙 4 (Goal-Driven Execution).** 모델은 기본적으로 "fix → done"으로 끝낸다. 명시적으로 "테스트 먼저 → 실패 → 수정 → 통과" 절차를 박아주지 않으면 검증 단계를 건너뛴다.

**그러므로 슬라이드 메시지는:**
- "CLAUDE.md가 모든 걸 바꾼다" (X)
- "현대 모델은 이미 잘하지만, **검증 절차만큼은 명시적 지시 없이 안 한다**" (O)

이게 N=1짜리 실험에서 끌어낼 수 있는 가장 정직한 결론이며, 동시에 청중에게 가장 actionable한 메시지.

---

## 재현 방법

```bash
cd karpathy-skills/experiment

# 1. 초기 코드 파일 준비 (/tmp/karpathy-task{1,2,3,4}.{py,jsx})
# 2. 워크트리 8개 생성
./run-template.sh 1-think /tmp/karpathy-task1.py
./run-template.sh 2-simple /tmp/karpathy-task2.py
./run-template.sh 3-surgical /tmp/karpathy-task3.jsx
./run-template.sh 4-goal /tmp/karpathy-task4.py

# 3. 각 worktree에서 Sonnet 4.6 세션 실행, tasks/<task>.md의 프롬프트 입력
#    (서브에이전트 디스패치 또는 수동 실행 가능)

# 4. diff 수집
for TASK in 1-think 2-simple 3-surgical 4-goal; do
  for COND in A B; do
    diff -u /tmp/karpathy-task${TASK%-*}.* \
            ../../karpathy-skills-wt-$TASK-$COND/trap.* \
            > runs/$TASK/$COND.diff
  done
done
```
