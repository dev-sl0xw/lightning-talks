# 3-surgical Observations

## A (CLAUDE.md 없음)
- 정확히 1줄 변경: `color = "blue"` → `color = "red"`
- 미사용 import, 주석, legacy concat 모두 손대지 않음

## B (Karpathy CLAUDE.md 적용)
- 정확히 1줄 변경 (A와 동일 diff)
- **응답에서 dead code (`import classnames`) 를 명시적으로 언급, 삭제하지 않음**

## 핵심 차이 한 줄
diff는 동일하지만 B는 "dead code를 발견했고 의도적으로 두었다"고 보고 — CLAUDE.md 원칙 3 ("notice unrelated dead code, mention - don't delete")을 행동으로 보여줌.

## 정량 메트릭
- diff 변경 줄: A=1, B=1
- 명세 외 변경: A=0, B=0
- 미사용 코드 보고 (삭제 X): A=no, B=yes

## 해석
Sonnet 4.6의 베이스라인이 이미 외과적이라 diff상 차이는 없음. CLAUDE.md의 효과는 "발견 사항을 사용자에게 노출"이라는 메타 행동으로 나타남. 더 어수선한 코드(주석 처리된 함수, 명백히 잘못된 들여쓰기 등)였다면 A가 손댔을 가능성.
