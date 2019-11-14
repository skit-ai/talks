0. What will happen?
====================

* Few things about MIDI
    * What is it?
    * Little history

* How I exploited MIDI data?

---

1. What is MIDI (Musical Instrument Digital Interface)?
=======================================================

* Allows electronic instruments and other digital musical tools to communicate
  with each other

* Virtual instruments

---

2. Little History
=================

* Developed in 1980s

* No standard. Only proprietary options

* 1980s Western Pop

---

3. How does it work?
====================

* There is no signal transmission. It's by messages

* MIDI protocol supports multiple channels

    * Each channel is a different instrument. An independant path for messages.

                        | Ch 1: Piano | Ch 2: Guitar |
                        |-------------|--------------|
                        | Ch 3: Bass  | Ch 4: Tuba   |

* A MIDI file has a series of messages (events)

---

4. Some events
==============

Note On, Note Off, Program Change, Velocity, Time etc.

---


5. An example of MIDI file and messages
=======================================

---

6. What have I done!?
=====================

* Use the MIDI messages to generate tabs

    * MIDI -> Frequency -> Notes -> Tabs

---

7. Guitar (Standard Tuning)
===========================

    {'F4': {1: 1, 2: 6, 3: 10, 4: 15, 5: 20, 6: ''},
     'F#4': {1: 2, 2: 7, 3: 11, 4: 16, 5: 21, 6: ''},
     'G4': {1: 3, 2: 8, 3: 12, 4: 17, 5: 22, 6: ''},
     'Ab4': {1: 4, 2: 9, 3: 13, 4: 18, 5: '', 6: ''},
     'G#4': {1: 4, 2: 9, 3: 13, 4: 18, 5: '', 6: ''},
     'A4': {1: 5, 2: 10, 3: 14, 4: 19, 5: '', 6: ''},
     'Bb4': {1: 6, 2: 11, 3: 15, 4: 20, 5: '', 6: ''},
     'A#4': {1: 6, 2: 11, 3: 15, 4: 20, 5: '', 6: ''},
     'B4': {1: 7, 2: 12, 3: 16, 4: 21, 5: '', 6: ''},
     'C5': {1: 8, 2: 13, 3: 17, 4: 22, 5: '', 6: ''},
     'C#5': {1: 9, 2: 14, 3: 18, 4: '', 5: '', 6: ''},
     'D5': {1: 10, 2: 15, 3: 19, 4: '', 5: '', 6: ''},
     'Eb5': {1: 11, 2: 16, 3: 20, 4: '', 5: '', 6: ''},
     'D#5': {1: 11, 2: 16, 3: 20, 4: '', 5: '', 6: ''},
     'E5': {1: 12, 2: 17, 3: 21, 4: '', 5: '', 6: ''},
     'F5': {1: 13, 2: 18, 3: 22, 4: '', 5: '', 6: ''},
     'F#5': {1: 14, 2: 19, 3: '', 4: '', 5: '', 6: ''},
     'G5': {1: 15, 2: 20, 3: '', 4: '', 5: '', 6: ''},
     'Ab5': {1: 16, 2: 21, 3: '', 4: '', 5: '', 6: ''},
     'G#5': {1: 16, 2: 21, 3: '', 4: '', 5: '', 6: ''},
     'A5': {1: 17, 2: 22, 3: '', 4: '', 5: '', 6: ''},
     'Bb5': {1: 18, 2: '', 3: '', 4: '', 5: '', 6: ''}
     .
     .
     .
     .
     }

---

8. Challenge
============

Optimal position. Multiple positions available for same note

---

9. Key finding
==============

[Krumhansl-Schmuckler key-finding algorithm](http://rnhart.net/articles/key-finding/)

* Uses note pitch and duration information to find key

* Correlation coefficient

* Can help in positioning. Where not to play

---

10. Demo
========

---

11. Limitations
===============

* Extracting relevant channel from complex MIDI file (it's in metadata!!)

* Not so good positioning. Improve scale & key detection

* Note playing techniques. Hammer-ons, bends etc.

* Non standard tuning

---

11. Resources
=============

Thanks to

* [Mido](https://github.com/mido/mido)
* [Music21](https://github.com/cuthbertLab/music21)

Code repository

* [tayuya](https://github.com/vipul-sharma20/tayuya)

