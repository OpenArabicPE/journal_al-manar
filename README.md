---
title: "Readme: Digital Manār"
author: Till Grallert
date: 2019-03-29
---


This repository is part of [OpenArabicPE](https://openarabicpe.github.io). It is home to the digital (TEI XML) edition of Rashīd Riḍā's journal *al-Manār*. It was originally set up in early 2016, inspired by and following the principles of [Digital Muqtabas](https://github.com/tillgrallert/digital-muqtabas). However, the files lay dormant for almost three years.

The digital text was taken from shamela.ws.

**IMPORANT NOTES**:

1. According to Florian Zemmin, the text from shamela.ws is missing all of Riḍā's tafṣīr that made up some 30 per cent of *al-Manār*'s text corpus.
2. The EPub / HTML from shamela.ws looks very different from other works I have seen and which were easly converted to TEI XML (re-)using the same code. I therefore asume that it is of a different origin than the other early twentieth-century texts.
    - I used regex to structure the file into
        + volumes: `<div type="volume" n="\d+"/>`
        + issues: `<div type="issue"/>` as children of the volumes
    - This was then split into one file per issue using the volume and the issue counts
3. Authorship information: a lot of the articles carry generic bylines with the following pattern: "الكاتب: محمد رشيد رضا". These are not found in the originals, if one consults the facsimiles available from <http://archive.alsharekh.org/> (formerly archive.sakhrit.co), but must have been added by later editors to the text.
    + their accuracy is unclear, some articles by Riḍā where either published posthumously after his death in 1935 or the attribution is wrong
4. The facsimiles from <http://archive.alsharekh.org/> confirm that shamela's page numbers correspond to the original print edition. However, there are only page numbers between articles! This means, they can only be used as an approximation.