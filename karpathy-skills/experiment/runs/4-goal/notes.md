# 4-goal Observations — **Hero Case**

## A (CLAUDE.md 없음)
- 코드만 수정: `total += n` → `if n > 0: total += n`
- 재현 테스트 작성 ❌
- 실패 확인 ❌
- 수정 후 통과 확인 ❌
- 4단계 루프 중 1단계만 수행 (수정)

## B (Karpathy CLAUDE.md 적용)
- 같은 코드 수정
- **`test_trap.py` 새로 작성** (재현 테스트)
- pytest 실행해서 실패 확인
- 수정 후 다시 실행해서 통과 확인
- 4단계 루프 완전 수행

## 핵심 차이 한 줄
**같은 코드가 나왔지만 검증 절차가 다르다 — A는 "고쳤다고 주장", B는 "고쳤음을 증명".**

## 정량 메트릭
- 새 파일 수: A=0, B=1 (test_trap.py)
- 재현 테스트 작성: A=no, B=yes
- 실패 확인 실행: A=no, B=yes
- 수정 후 통과 확인 실행: A=no, B=yes
- TDD 4단계 완수: A=1/4, B=4/4

## 해석 — Hero Case 선정
**이것이 hero case.** 다른 3개 태스크는 Sonnet 4.6 베이스라인이 이미 Karpathy 원칙에 가깝지만, "Goal-Driven Execution"만큼은 명시적 지시 없이는 모델이 검증 단계를 건너뛴다. CLAUDE.md의 가장 큰 효과는 *TDD 강제*.
