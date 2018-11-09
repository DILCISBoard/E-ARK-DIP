# **​2 Structure **

## 2.1 Structure
The folder structure of an CS DIP must comply with the requirements for the folder structure for an CS IP, see [Folder structure of the CS IP](https://dilcisboard.github.io/E-ARK-CSIP/specification/implementation/structure/folders/).

The CS IP folder structure and its requirements is visualised in the figure below:

![IP Folder Structure](fig_8_cs_ip_struct.png)

- Green boxes represent folders
- Red boxes represent files. 
- Boxes with full lines represent mandatory files/folders
- Boxes with dotted lines represent optional files/folders. 

As can be seen from the figure - the requirements for the folder structure for a CS IP is at a bare minimum and makes it possible to have several extra optional folders and files in a CS IP (see boxes with dotted lines). 
The first thing to be said about the CS DIP structure in regard to CS IP structure is that a CS DIP will always consist of some of those files and folders that are optional in the CS IP minimum structure. 
There must be data to dissemenate. Since the definition of a CS DIP is that it corresponds to a CS IP which is ready to be processed by its designated Access Software, this leaves the question as to which data 
in the CS IP should be chosen to be encompassed in the CS DIP. It is possible that an AIP in its current state and in its entirety can be delivered to a Consumer as is and still be considered a CS DIP. 
That CS DIP can contain the submission representation, and one or more preservation representations. Often, however, the OAIS is interested in leaving out irrelevant data and metadata and only present the 
Consumer with the data and metadata that the Consumer is interested in. This could be isolated to the content in one single representation in a CS AIP, or maybe only a portion of a single representation in a CS AIP.     
Maybe down to only one specific file. The point here is that a plethora of different CS DIPs can be created out of a CS AIP. 


DIPSTR1: The `data` folder MUST include at least one file 
DIPSTR2: At least one of the `metadata` subfolders SHOULD include at least one file that describes the designated Access Software 


