# **​2 Structure and Content Information Types**

## 2.1 Structure
The folder structure of an CS DIP must comply with the requirements for the folder structure for an CS IP, see [Folder structure of the CS IP](https://dilcisboard.github.io/E-ARK-CSIP/specification/implementation/structure/folders/).

The CS IP folder structure and its requirements is visualised in the figure below:

![IP Folder Structure](fig_8_cs_ip_struct.png)

- Green boxes represent folders
- Red boxes represent files. 
- Boxes with full lines represent mandatory files/folders
- Boxes with dotted lines represent optional files/folders. 

As can be seen from the figure - the requirements for the folder structure for a CS IP is at a bare minimum and makes it possible to have several extra optional folders in a CS IP (see boxes with dotted lines). 
The first thing to be said about the CS DIP structure in regard to CS IP structure is that a CS DIP always will consist of some of those files and folders that are optional in the CS IP minimum structure. 
There must be data to dissemenate:

DIPSTR1: The data folder MUST include at least one file in the folder ´data´ 

Since the definition of a CS DIP is that it corresponds to a CS IP which is ready to be processed by its designated Access Software, this leaves the question as to which data in the CS IP should be chosen
to be encompassed in the CS DIP.

The DIP folder structure can change slightly depending on its Content Information Type. The sections below that deal with the DIP format specifications will reflect these changes.
