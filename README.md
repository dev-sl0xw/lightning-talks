# Lightning Talks

사내 Lightning Talk 발표 자료 모음 — 한국어 마스터 → 일본어 발표용 번역.

## 발표 자료

| # | 주제 | 한국어 | 일본어 | 발표 스크립트 |
| --- | --- | --- | --- | --- |
| 1 | **하네스 엔지니어링** — 떠난 사람의 자리를 비워두지 않는 법 | [`slides.ko.md`](./slides.ko.md) | [`slides.ja.md`](./slides.ja.md) | [`script.ko.md`](./script.ko.md) · [`script.ja.md`](./script.ja.md) |
| 2 | **카파시 4원칙 적용 결과** — 정말 효과가 있는지 A/B로 확인 | [`karpathy-skills/slides.ko.md`](./karpathy-skills/slides.ko.md) | [`karpathy-skills/slides.ja.md`](./karpathy-skills/slides.ja.md) | [`karpathy-skills/script.ko.md`](./karpathy-skills/script.ko.md) · [`karpathy-skills/script.ja.md`](./karpathy-skills/script.ja.md) |

LT #2 의 A/B 실험 원본 데이터는 [`karpathy-skills/experiment/`](./karpathy-skills/experiment/) 참조.

**📄 PDF 다운로드:** [Releases (latest)](https://github.com/dev-sl0xw/lightning-talks/releases/latest) — 두 LT 한·일본어 PDF 4개 첨부.

---

## 사전 준비

```bash
npm install                  # LT #1 (루트)
cd karpathy-skills && npm install  # LT #2
```

Node.js / npm 이 설치되어 있어야 합니다. Marp CLI 는 `devDependencies` 로 로컬 설치됩니다 (전역 설치 불필요).

## 빌드

각 LT 디렉토리에서:

```bash
# 한국어 (마스터)
npm run build:ko:html   # build/slides.ko.html
npm run build:ko:pdf    # build/slides.ko.pdf

# 일본어 (발표용)
npm run build:ja:html   # build/slides.ja.html
npm run build:ja:pdf    # build/slides.ja.pdf
```

## 프리뷰

```bash
npm run preview:ko   # 한국어 슬라이드 실시간 프리뷰
npm run preview:ja   # 일본어 슬라이드 실시간 프리뷰
```

`--watch` 옵션이 켜져 있어 마크다운을 수정하면 자동으로 다시 렌더링됩니다.

## 번역 워크플로우

1. `slides.ko.md` 에서 한국어 마스터 슬라이드를 완성합니다.
2. `cp slides.ko.md slides.ja.md` 로 복사합니다.
3. `glossary.md` 의 용어 사전을 기준으로 `slides.ja.md` 를 일본어로 번역합니다 (「です・ます」체 + 불릿 압축).

## 디렉토리 구조

```
slides.ko.md / slides.ja.md  LT #1 슬라이드
script.ko.md / script.ja.md  LT #1 스크립트
glossary.md                  LT #1 용어 사전
themes/                      Marp 커스텀 테마 (.css)
assets/ · demo/              슬라이드용 자산
build/                       빌드 산출물 (HTML/PDF) — gitignore

karpathy-skills/             LT #2 (자체 package.json + glossary + 실험 데이터)
```
