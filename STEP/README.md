# STEP files
Included here are all the files to create and print the case. These files are intended to be printed with an Ender 3, or some equivalent printer with a similar build volume. There are two versions of some files depending on whether you are using an SFX or ATX power supply unit, they are labeled as such.

In case you'd prefer to edit and/or modify what portions of the big case are printed, the full case is included as full-case.step.

# How to print
Simply open the STEP files in your choice of slicer and create the save the GCODE for the print. If you cannot open STEP files, you should convert the files to STL. You can do this easily with TinkerCAD, by importing the STEP and exporting it as STL with no modifications.

| Part | Filename | Amount | Notes. |
| - | - | - | - |
| Back Bracket | `bracket-back.step` | 1 | Goes on the back side of the case to connect the big four pieces. |
| Mini Bracket | `bracket-mini.step` | 12 | Helps connect smaller bits of the case together. |
| Handle Middle | `handle-mid.step` | 1 | The center piece connecting the two handle ends together. |
| Handle Ends | `handle-end.step` | 2 | The two ends of the handle that form the bridge of the handle to the case. |
| Case Top Right | `case-top-right.step` | 1 | Top right portion of the case. |
| Case Bottom Right | `case-bot-right.step` | 1 | Bottom right portion of the case. |
| Case Top Left | `case-top-left-<ff>.step` | 1 | Top left portion of the case. Note: `<ff>` refers to the form factor of the power supply you're using, being ATX or SFX. |
| Case Bottom Left | `case-bot-left-<ff>.step` | 1 | Bottom left portion of the case. Note: `<ff>` refers to the form factor of the power supply you're using, being ATX or SFX. |

Take caution in printing, as warping prints can make assembly more difficult and throw off measurements.

# How to assemble
You will need a soldering iron that can meld the plastic you used together, you can cut lengths of plastic from your spool to use or just use the existing plastic as the bond. Be careful of toxins the plastic may produce when heated.

0. Connect the two handle ends to the middle pieces. Meld the pieces together.
0. Place the back bracket down on a steady large surface (like a table).
0. Connect the top two pieces together with the handle. Do not meld the pieces together, otherwise the handle cannot rotate.
0. Place the connected pieces from above as well as the bottom two case pieces and arrange them over the back bracket.
0. Push down on all the pieces to join them with the back bracket by the force of friction, leave the case laid down.
0. Connect all the mini brackets around the case such as between the right two pieces, the bottom pieces, and the left two pieces.
0. The mini brackets that connect to the top of the PSU housing will need to be cut inside the housing to allow the PSU to fit. Do that.
0. Adjust the pieces so that the four main body pieces line up and are flush with each other as best as possible.
0. While the case remains laid down, take the iron and meld the four main pieces together. Additional connection can be made by using the mini brackets as plastic to connect the pieces together.
0. As most of the case is connected while laid down, it can be stood up. Use this opportunity to meld more of the outside of the case that was inaccessible while it was laid down.
0. Place the feet into the slots on the bottom of the case. Line them up square with the case and use the iron to meld them to the case. Careful not to burn yourself while keeping the feet lined up.
0. Also meld the top of the feet on the inside of the case to the floor of the case.
0. That's all! You can now build in the case as you normally would.
