---
title: "Readme: Digital Manār"
author: Till Grallert
date: 2019-03-29
ORCID: orcid.org/0000-0002-5739-8094
---


This repository is part of [OpenArabicPE](https://openarabicpe.github.io). It is home to the digital (TEI XML) edition of Rashīd Riḍā's journal *al-Manār*. It was originally set up in early 2016, inspired by and following the principles of [Digital Muqtabas](https://github.com/openarabicpe/journal_al-muqtabas). However, the files lay dormant for almost three years. If you just want to browse the edition in a more human-readable view, start [here](https://openarabicpe.github.io/journal_al-manar/tei/oclc_1588981-v_1-i_1.TEIP5.xml). All bibliographic metadata is available as part of [OpenArabicPE's public Zotero group](https://www.zotero.org/groups/904125/openarabicpe/items/). A simple [Google search](https://cse.google.com/cse?cx=012251040084107011117:jof1v_ejndo) has been set-up to search the full-text of OpenArabicPE's entire corpus.

The digital text was downloaded from shamela.ws. Digital facsimiles are available from

1. [*arshīf al-majallāt al-adabiyya wa-l-thaqafiyya al-ʿarabiyya*](http://archive.alsharekh.org/newmagazineYears.aspx?MID=33)
2. HathiTrust

# **IMPORANT NOTES**:

1. According to Florian Zemmin, the text from shamela.ws is missing all of Riḍā's tafṣīr that made up "more than one fifth" of *al-Manār*'s text corpus [-@Zemmin+2016, 232].
2. The EPub / HTML from shamela.ws looks very different from other works I have seen and which were easly converted to TEI XML (re-)using the same code. I therefore asume that it is of a different origin than the other early twentieth-century texts.
    - I used regex to structure the file into
        + volumes: `<div type="volume" n="\d+"/>`
        + issues: `<div type="issue"/>` as children of the volumes
    - This was then split into one file per issue using the volume and the issue counts
    - The division into articles and sections is imperfect as shamela did not record all section titles
        - consider, for instance [v.25(3)](tei/oclc_1588981-v_25-i_3.TEIP5.xml) published in March 1924:
            - The text from shamela commences with an article titled "التبشير والمبشرون في نظر المسلمين" and attributed to Rashīd Riḍa.
            - Looking at the facsimiles from [sakhrit](https://archive.alsharekh.org/Articles/33/3412/94046), we see that this article was part of the section "فتاوى المنار"
3. **Authorship information**: a lot of the articles carry generic bylines with the following pattern: "الكاتب: محمد رشيد رضا". These are not found in the originals, if one consults the facsimiles available from [sakhrit][sakhrit] (formerly archive.sakhrit.co), but must have been added by later editors to the text. Their accuracy is unclear, some articles by Riḍā where either published posthumously after his death in 1935 or the attribution is wrong.
    - consider, for instance [v.25(3)](tei/oclc_1588981-v_25-i_3.TEIP5.xml) published in March 1924 (facsimiles are [here](https://archive.alsharekh.org/contents/33/3412)):
        - The text "[سكة الحديد الحجازية](tei/oclc_1588981-v_25-i_3.TEIP5.xml#div_3.d2e1002)" clearly states in its opening paragraph that it was written by an anonymous "Syrian scholar" but shamela added Muḥammad Rashīd Riḍā as author anyway.
        - The same is true for the following article "[الوثائق الرسمية في المسألة العربية](tei/oclc_1588981-v_25-i_3.TEIP5.xml#div_4.d2e1348)", which provides some texts from other sources and adds a very short comment from al-Manār. Again shamela added Muḥammad Rashīd Riḍā as author.
4. The facsimiles from [sakhrit][sakhrit] confirm that shamela's page numbers correspond to the **second** printed edition (published in 1327 aH.). However, there are only page numbers between articles! This means, they can only be used as an approximation.

# to do
## structure

- there are many articles, which are still marked-up as notes
- paragraphs: the mark-up contains only line breaks but not paragraphs
- poetry:
- sections:
    + titles:
        * new publications/ review section
            + done تقريظ المطبوعات الجديدة
            + done تقريظ المطبوعات الحديثة
            + done تقريظ المطبوعات
        + done الأخبار والآراء
    + dividers of articles in sections
        * a line with 3 asterisks
        * the next line is wrapped in brackets
    + workflow:
        1. Regex: search and replace
            + find: `(<div[^>]+type=)"item" subtype="article"([^>]+>\s+<head[^>]+>تقريظ المطبوعات الجديدة</head>)`
            + replace: `$1"section"$2`
        2. XSLT: wrap the entire content of these `<div>`s in `<div type="item" subtype="article">`
- empty notes

# named entities
## periodicals

Periodicals have been marked-up in an automated process with manual corrections after removing `<lb/>` elements.

Automated linking to the authoritative bibliography was first done on 20 September 2024. Results

- 1527 successful links of titles
    - 895 in a second run
- 193 outright failures
- 817 failures for ambigous mentions or references to titles that had not been published yet.
    - the latter is a faulty implementation based on the error messages 

[sakhrit]: https://archive.alsharekh.org/