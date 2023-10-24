# IGEL OS Branches

Shows the branches of IGEL OS.

[What is the Meaning of IGEL Release Names?](https://kb.igel.com/licensesmore-igelos11/en/what-is-the-meaning-of-igel-release-names-10325217.html)

-----

## [IGEL News: Builds](IGEL-News-Builds.md)

Lists what changes are in the build.

-----

## Legend
```mermaid
flowchart LR
    A === B === C === D === E  
    A((Public Build))
    B[Private Build]
    C>Dead End Release]
    D[[Unreleased]]
    E[No Release Notes]
    style E fill:#828282
```

### Steps to request a Private Build

- Log onto [IGEL Community on Slack](https://www.igelcommunity.com/)
- Select channel [#new-product-releases](https://igelcommunity.slack.com/archives/C8EQWAPAP)
- The release is available by using the `Workflow Feature`. Click on `+`, then select `Software Request 01` and fill out the data needed.

![requestrelease](../../Images/IGEL-OS-Branches-01.png)

-----

## IGEL OS 11.09

**NOTE:** 11.09.XXX uses Ubuntu 22.04 libraries

```mermaid
flowchart LR
    11.09.100-- 2023-10-24 -->11.09.110((11.09.110))
    11.09.100-- 2023-10-20 -->11.09.103
    11.09.100-- 2023-10-19 -->11.09.104
    11.09.100-- 2023-10-18 -->11.09.105
    11.09.100((11.09.100))
    click 11.09.110 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.09.110.txt" _blank
    click 11.09.103 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.09.103.txt" _blank
    click 11.09.104 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.09.104.txt" _blank
    click 11.09.105 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.09.105.txt" _blank
    click 11.09.100 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.09.100.txt" _blank
```

-----

## IGEL OS 11.08

**NOTE:** 11.08.XXX uses Ubuntu 18.04 libraries

```mermaid
flowchart LR
    11.08.440-- 2023-10-17 -->11.08.460
    11.08.454-- 2023-10-12 -->11.08.466.DER>11.08.466.DER]
    11.08.454-- 2023-10-11 -->11.08.465
    11.08.440-- 2023-09-21 -->11.08.441
    11.08.440-- 2023-09-21 -->11.08.463
    11.08.230-- 2023-09-20 -->11.08.279
    11.08.440-- 2023-09-20 -->11.08.461
    11.08.360-- 2023-09-18 -->11.08.388
    11.08.457-- 2023-09-13 -->11.08.458
    11.08.455-- 2023-09-11 -->11.08.457
    11.08.440-- 2023-09-08 -->11.08.455
    11.08.440-- 2023-09-08 -->11.08.454
    11.08.440-- 2023-09-07 -->11.08.453
    11.08.440-- 2023-09-06 -->11.08.451
    11.08.440-- 2023-09-04 -->11.08.449
    11.08.384-- 2023-08-29 -->11.08.387
    11.08.330-- 2023-08-24 -->11.08.348
    11.08.440-- 2023-08-21 -->11.08.445
    11.08.440-- 2023-08-21 -->11.08.443
    11.08.440-- 2023-08-21 -->11.08.442
    11.08.360-- 2023-08-16 -->11.08.440((11.08.440))
    11.08.381-- 2023-08-14 -->11.08.385
    11.08.382-- 2023-08-14 -->11.08.384
    11.08.330-- 2023-08-04 -->11.08.347
    11.08.360-- 2023-08-04 -->11.08.382
    11.08.360-- 2023-08-02 -->11.08.381
    11.08.360-- 2023-07-31 -->11.08.377
    11.08.360-- 2023-06-26 -->11.08.364-- 2023-07-28 -->11.08.371
    11.08.360-- 2023-07-26 -->11.08.378
    11.08.361-- 2023-07-24 -->11.08.376
    11.08.360-- 2023-07-18 -->11.08.374
    11.08.345-- 2023-07-14 -->11.08.346
    11.08.361-- 2023-07-10 -->11.08.373
    11.08.360-- 2023-07-04 -->11.08.372
    11.08.299-- 2023-06-30 -->11.08.309
    11.08.360-- 2023-06-30 -->11.08.368
    11.08.360-- 2023-06-29 -->11.08.367
    11.08.344-- 2023-06-28 -->11.08.345
    11.08.338-- 2023-06-23 -->11.08.344
    11.08.338-- 2023-06-22 -->11.08.343
    11.08.360-- 2023-06-22 -->11.08.365
    11.08.360-- 2023-06-20 -->11.08.361
    11.08.264-- 2023-06-19 -->11.08.277
    11.08.330-- 2023-06-13 -->11.08.360((11.08.360))
    11.08.330-- 2023-06-10 -->11.08.338
    11.08.330-- 2023-06-06 -->11.08.337
    11.08.330-- 2023-05-31 -->11.08.335
    11.08.330-- 2023-05-30 -->11.08.336.DER>11.08.336.DER]
    11.08.290-- 2023-05-27 -->11.08.333
    11.08.330-- 2023-05-26 -->11.08.334
    11.08.330-- 2023-05-24 -->11.08.331
    11.08.110-- 2023-05-23 -->11.08.118.DER>11.08.118.DER]
    11.08.290-- 2023-05-17 -->11.08.330((11.08.330))
    11.08.256-- 2023-05-12 -->11.08.307
    11.08.290-- 2023-05-04 -->11.08.305
    11.08.290-- 2023-04-27 -->11.08.303
    11.08.236-- 2023-04-25 -->11.08.301
    11.08.290-- 2023-04-19 -->11.08.299
    11.08.292-- 2023-04-18 -->11.08.296
    11.08.290-- 2023-04-18 -->11.08.298
    11.08.290-- 2023-04-18 -->11.08.297
    11.08.290-- 2023-04-13 -->11.08.295
    11.08.290-- 2023-04-12 -->11.08.294
    11.08.290-- 2023-03-31 -->11.08.292
    11.08.230-- 2023-03-30 -->11.08.290((11.08.290))
    11.08.230-- 2023-03-20 -->11.08.274
    11.08.236-->11.08.256[[11.08.256]]-- 2023-03-07 -->11.08.267
    11.08.240-- 2023-03-01 -->11.08.265 
    11.08.252-- 2023-02-26 -->11.08.264-- 2023-03-15 -->11.08.268-- 2023-03-16 -->11.08.273
    11.08.200-- 2023-02-24 -->11.08.262
    11.08.243-- 2023-02-10 -->11.08.251-- 2023-03-01 -->11.08.266
    11.08.230-- 2023-02-06 -->11.08.247
    11.08.230-- 2023-02-02 -->11.08.244
    11.08.240-- 2023-02-24 -->11.08.263
    11.08.240-- 2023-02-22 -->11.08.257
    11.08.240-- 2023-02-20 -->11.08.255-- 2023-02-22 -->11.08.261
    11.08.230-- 2023-02-10 -->11.08.240
    11.08.230((11.08.230))-->11.08.232[[11.08.232]]-- 2023-02-14 -->11.08.252
    11.08.200-- 2022-12-13 -->11.08.230-- 2022-12-20 -->11.08.235-- 2022-12-28 -->11.08.236-- 2023-01-20 -->11.08.243-->11.08.245-- 2023-02-06 -->11.08.248
    11.08.200-- 2022-11-28 -->11.08.218
    11.08.200-- 2022-11-18 -->11.08.212
    11.08.200-- 2022-11-17 -->11.08.211
    11.08.200-- 2022-10-24 -->11.08.207
    11.08.200-- 2022-10-27 -->11.08.205
    11.08.200-- 2022-10-25 -->11.08.204
    11.08.200((11.08.200))-- 2022-10-19 -->11.08.202-- 2022-11-23 -->11.08.215-- 2022-11-24 -->11.08.216-- 2022-11-28 -->11.08.219
    11.08.110-- 2022-10-04 -->11.08.113-- 2022-10-13 -->11.08.114
    11.08.110((11.08.110))-- 2022-09-22 -->11.08.112.DER>11.08.112.DER]
    11.08.100-- 2022-09-15 -->11.08.110-- 2022-09-20 -->11.08.111
    11.08.100((11.08.100))-- 2022-09-07 -->11.08.101
    click 11.08.460 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.460.txt" _blank
    click 11.08.466.DER "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.466.DER.txt" _blank
    click 11.08.465 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.465.txt" _blank
    click 11.08.441 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.441.txt" _blank
    click 11.08.463 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.463.txt" _blank
    click 11.08.279 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.279.txt" _blank
    click 11.08.461 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.461.txt" _blank
    click 11.08.388 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.388.txt" _blank
    click 11.08.458 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.458.txt" _blank
    click 11.08.457 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.457.txt" _blank
    click 11.08.455 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.455.txt" _blank
    click 11.08.454 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.454.txt" _blank
    click 11.08.453 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.453.txt" _blank
    click 11.08.451 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.451.txt" _blank
    click 11.08.449 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.449.txt" _blank
    click 11.08.387 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.387.txt" _blank
    click 11.08.348 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.348.txt" _blank
    click 11.08.445 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.445.txt" _blank
    click 11.08.443 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.443.txt" _blank
    click 11.08.442 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.442.txt" _blank
    click 11.08.440 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.440.txt" _blank
    click 11.08.385 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.385.txt" _blank
    click 11.08.384 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.384.txt" _blank
    click 11.08.347 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.347.txt" _blank
    click 11.08.382 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.382.txt" _blank
    click 11.08.381 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.381.txt" _blank
    click 11.08.377 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.377.txt" _blank
    click 11.08.371 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.371.txt" _blank
    click 11.08.378 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.378.txt" _blank
    click 11.08.376 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.376.txt" _blank
    click 11.08.374 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.374.txt" _blank
    click 11.08.346 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.346.txt" _blank
    click 11.08.373 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.373.txt" _blank
    click 11.08.372 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.372.txt" _blank
    click 11.08.309 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.309.txt" _blank
    click 11.08.368 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.368.txt" _blank
    click 11.08.367 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.367.txt" _blank
    click 11.08.345 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.345.txt" _blank
    click 11.08.344 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.344.txt" _blank
    click 11.08.343 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.343.txt" _blank
    click 11.08.365 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.365.txt" _blank
    click 11.08.364 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.364.txt" _blank
    click 11.08.361 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.361.txt" _blank
    click 11.08.277 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.277.txt" _blank
    click 11.08.360 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.360.txt" _blank
    click 11.08.338 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.338.txt" _blank
    click 11.08.337 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.337.txt" _blank
    click 11.08.335 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.335.txt" _blank
    click 11.08.336.DER "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.336.DER.txt" _blank
    click 11.08.333 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.333.txt" _blank
    click 11.08.334 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.334.txt" _blank
    click 11.08.331 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.331.txt" _blank
    click 11.08.118.DER "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.118.DER.txt" _blank
    click 11.08.330 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.330.txt" _blank
    click 11.08.307 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.307.txt" _blank
    click 11.08.305 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.305.txt" _blank
    click 11.08.303 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.303.txt" _blank
    click 11.08.301 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.301.txt" _blank
    click 11.08.299 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.299.txt" _blank
    click 11.08.296 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.296.txt" _blank
    click 11.08.298 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.298.txt" _blank
    click 11.08.297 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.297.txt" _blank
    click 11.08.295 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.295.txt" _blank
    click 11.08.294 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.294.txt" _blank
    click 11.08.292 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.292.txt" _blank
    click 11.08.292 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.292.txt" _blank
    click 11.08.290 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.290.txt" _blank
    click 11.08.274 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.274.txt" _blank
    click 11.08.273 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.273.txt" _blank
    click 11.08.268 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.268.txt" _blank
    click 11.08.267 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.267.txt" _blank
    click 11.08.266 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.266.txt" _blank
    click 11.08.265 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.265.txt" _blank
    click 11.08.264 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.264.txt" _blank
    click 11.08.263 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.263.txt" _blank
    click 11.08.262 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.262.txt" _blank
    click 11.08.261 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.261.txt" _blank
    click 11.08.257 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.257.txt" _blank
    click 11.08.255 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.255.txt" _blank
    click 11.08.252 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.252.txt" _blank
    click 11.08.251 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.251.txt" _blank
    click 11.08.248 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.248.txt" _blank
    click 11.08.247 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.247.txt" _blank
    click 11.08.244 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.244.txt" _blank
    click 11.08.243 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.243.txt" _blank
    click 11.08.240 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.240.txt" _blank
    click 11.08.236 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.236.txt" _blank
    click 11.08.235 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.235.txt" _blank
    click 11.08.230 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.230.txt" _blank
    click 11.08.219 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.219.txt" _blank
    click 11.08.218 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.218.txt" _blank
    click 11.08.216 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.216.txt" _blank
    click 11.08.215 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.215.txt" _blank
    click 11.08.212 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.212.txt" _blank
    click 11.08.211 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.211.txt" _blank
    click 11.08.207 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.207.txt" _blank
    click 11.08.205 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.205.txt" _blank
    click 11.08.204 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.204.txt" _blank
    click 11.08.202 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.202.txt" _blank
    click 11.08.200 "https://github.com/IGEL-Community/IGEL-Docs-v02/tree/main/docs/Docs/ReleaseNotes/01-OS11/readme11.08.200.txt" _blank
```

----

## IGEL OS 11.07

```mermaid
flowchart LR
  11.07.100-->11.07.110-->11.07.140-->11.07.170-->11.07.910-->11.07.920((11.07.920))-->11.07.921-->11.07.922
  11.07.910-->11.07.911
  11.07.181-->11.07.191
  11.07.170-->11.07.205
  11.07.170-->11.07.203
  11.07.170-->11.07.201
  11.07.170-->11.07.189-->11.07.196
  11.07.170-->11.07.188
  11.07.170-->11.07.185
  11.07.170-->11.07.182
  11.07.170-->11.07.181-->11.07.198-->11.07.207
  11.07.170-->11.07.179
  11.07.170-->11.07.178
  11.07.170-->11.07.176
  11.07.170-->11.07.175
  11.07.170-->11.07.174
  11.07.170-->11.07.173
  11.07.170((11.07.170))-->11.07.171
  11.07.140-->11.07.150-->11.07.160
  11.07.110-->11.07.133-->11.07.136-->11.07.139-->11.07.152
  11.07.140-->11.07.144-->11.07.147-->11.07.151
  11.07.140-->11.07.148
  11.07.140-->11.07.143
  11.07.140((11.07.140))-->11.07.141
  11.07.110-->11.07.134
  11.07.110-->11.07.123-->11.07.126
  11.07.110-->11.07.122
  11.07.110-->11.07.119
  11.07.110-->11.07.115
  11.07.110((11.07.110))-->11.07.114
  11.07.100-->11.07.113
  11.07.100-->11.07.112
  11.07.100-->11.07.107
  11.07.100-->11.07.103
  11.07.100((11.07.100))-->11.07.102
```

----

## IGEL OS(RPI4)  

```mermaid
flowchart LR
  11.02.100((11.02.100))-->11.02.110((11.02.110))-- 2022-12-13 -->11.02.120((11.02.120))
  11.01.111((11.01.111))-->11.01.120((11.01.120))
```
