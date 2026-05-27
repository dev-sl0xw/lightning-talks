# 2-simple Observations

## A (CLAUDE.md 없음)
- `def add_todo(item): todos.append(item)` 3줄
- 새 클래스 0, 새 파일 0

## B (Karpathy CLAUDE.md 적용)
- 동일한 결과: `def add_todo(item): todos.append(item)` 3줄
- 새 클래스 0, 새 파일 0

## 핵심 차이 한 줄
**차이 없음.** Sonnet 4.6의 베이스라인이 이미 최소한의 단순 구현을 선호한다.

## 정량 메트릭
- 새 클래스/인터페이스: A=0, B=0
- 총 코드 줄: A=4, B=4
- diff +/-: A=+3/-0, B=+3/-0

## 해석
"과잉 추상화" 함정은 구버전 모델(GPT-3.5 시절, 초기 Claude)에서 두드러졌으나, Sonnet 4.6 수준에서는 이미 default가 단순화. CLAUDE.md의 효과를 보려면 더 모호한 프롬프트가 필요할 가능성.
