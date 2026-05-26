# 발표 전 사용자 액션 체크리스트

자동화로 완성된 부분은 모두 끝났습니다. 아래는 **사용자가 직접 수행해야 할 항목** 입니다.

## 1. 한국어 셀프 리허설 (Task 9)

목적: 시간 측정 + 번역 가능성 점검 + 어색한 문장 발견.

- [ ] 타이머를 켜고 `script.ko.md` 를 보면서 처음부터 끝까지 한국어로 소리 내어 발표
- [ ] 누적 시간이 **7:00~8:00** 안에 들어오는지 확인
- [ ] 입에 잘 안 붙는 문장 발견 시 → `slides.ko.md` / `script.ko.md` 양쪽 수정
- [ ] 한국어 한정 표현이나 사자성어가 슬쩍 들어가 있는지 점검 (`glossary.md` 블랙리스트 참조)
- [ ] 수정 후 `npm run build:ko:html` 재빌드해서 시각 확인
- [ ] 수정 사항이 있다면 한국어 측 수정을 일본어 측에도 동일하게 반영 (`slides.ja.md` / `script.ja.md`)

```bash
cd /Volumes/data/claude-vibe-workspace/company-lightningtalk
npm run preview:ko   # 실시간 프리뷰 (수정하면 즉시 반영)
```

## 2. 데모 백업 GIF 녹화 (Task 12)

목적: 라이브 데모가 실패해도 발표가 무너지지 않도록.

- [ ] `demo/scenario.md` 의 "手順" 섹션대로 1회 성공 시나리오를 화면 녹화 (QuickTime / OBS / asciinema 등)
- [ ] 60초 이내 길이를 목표
- [ ] GIF 변환:

   ```bash
   cd /Volumes/data/claude-vibe-workspace/company-lightningtalk
   ffmpeg -i recording.mov -vf "fps=10,scale=1280:-1:flags=lanczos" -loop 0 demo/backup.gif
   ```

- [ ] `demo/backup.gif` 파일 크기 확인 (10MB 이하 권장; 넘으면 `scale=1024:-1` 또는 `fps=8`)
- [ ] `slides.ja.md` Slide 8 (デモ 진입 슬라이드) 끝에 GIF 임베드:

   ```markdown
   ![bg fit](demo/backup.gif)
   ```

  또는 별도 백업 슬라이드를 한 장 추가
- [ ] `npm run build:ja:html` 재빌드하고 브라우저에서 GIF가 정상 재생되는지 확인
- [ ] `git add demo/backup.gif slides.ja.md && git commit -m "feat: add demo backup gif"`

## 3. 일본어 셀프 리허설 (Task 13 일부)

목적: 일본어로 발화 시 부담스러운 단어 발견 + 시간 재측정.

- [ ] 타이머를 켜고 `script.ja.md` 보면서 처음부터 끝까지 일본어로 소리 내어 발표
- [ ] 한국어보다 약간 더 걸리는 경향이 있음 → **7:30~8:30** 범위에서 종료 허용
- [ ] 한자 발음에 자신 없는 단어가 있다면 그 자리에서 더 평이한 표현으로 교체
- [ ] `slides.ja.md` 와 `script.ja.md` 의 단어가 일치하는지 확인 (청중이 슬라이드 읽으면서 같은 단어를 귀로 들어야 함)
- [ ] 수정 후 `npm run build:ja:html` 재빌드

```bash
npm run preview:ja
```

## 4. (권장) 일본어 모국어 동료 사전 발표

목적: 발표 핵심이 "조직이 얻는 것"으로 전달되는지 검증.

- [ ] 일본어 모국어 동료 1명에게 5분 사전 발표
- [ ] 발표 후 동료에게 묻기: "**이 발표가 왜 조직에 필요한지 한 문장으로 요약해줘**"
- [ ] 동료의 요약이 "도구가 좋다" 가 아니라 **"조직이 얻는 것 (지식 자산화 / 인수인계 자동화 등)"** 으로 나오는지 확인
- [ ] 안 나오면 효과 슬라이드 (6, 7) 또는 마무리 슬라이드 (11) 멘트 강화
- [ ] 동료가 어색하다고 짚어준 일본어 표현 1~3개 즉시 교체

## 5. 표지 슬라이드 placeholder 채우기

- [ ] `slides.ko.md` / `slides.ja.md` Slide 1 의 `<small>발표자 이름 · 소속 · 2026-XX-XX</small>` / `<small>発表者氏名 · 所属 · 2026-XX-XX</small>` 부분에 실제 이름/소속/날짜 입력
- [ ] `slides.ko.md` / `slides.ja.md` Slide 11 의 `<repo URL 또는 사내 위키 링크>` / `<repo URL または社内 wiki リンク>` 부분에 실제 링크 입력 (또는 줄 자체 제거)
- [ ] 재빌드 후 PDF 다시 출력:

   ```bash
   npm run build:ko:pdf
   npm run build:ja:pdf
   ```

## 6. 발표 당일 30분 전 (data demo/scenario.md 참조)

- [ ] 네트워크 연결 확인
- [ ] `claude` CLI 동작 확인 — `demo/scenario.md` Step 2 입력을 한 번 예행
- [ ] 모든 알림 OFF (Slack / Mail / Calendar / OS 통지)
- [ ] 터미널 + 슬라이드 외 창 모두 닫음
- [ ] 화면 공유 해상도 확인
- [ ] `backup.gif` 정상 재생 확인 (한 번 슬라이드 열어서)
- [ ] 비상 탈출 멘트 「環境の問題で動かないので、事前に録画したものをお見せします。」 한 번 소리 내어 리허설

## 7. 발표 자료 공개 결정 (보류 중)

- [ ] git repo 사내 공개 vs 비공개 결정
- [ ] 공개 시 Slide 11 의 발표 자료 링크 활성화
- [ ] 비공개 시 슬라이드의 해당 줄 제거 또는 사내 wiki 링크로 교체

---

## 산출물 위치 요약

- `slides.ko.md` / `slides.ja.md` — Marp 소스
- `script.ko.md` / `script.ja.md` — 발표 스크립트
- `outline.ko.md` — 작업용 outline (발표 당일에는 사용하지 않음)
- `glossary.md` — 한↔일 용어 매핑 (참고용)
- `demo/scenario.md` — 데모 운영 매뉴얼 (당일 손에 있어야 할 문서)
- `build/slides.ko.pdf` / `build/slides.ja.pdf` — 인쇄/배포용 PDF
- `build/slides.ko.html` / `build/slides.ja.html` — 브라우저 발표용
