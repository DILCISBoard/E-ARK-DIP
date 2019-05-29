
# I. Acknowledgements
The E-ARK Dissemination Information Package (DIP) Specification was first developed within the E-ARK project in 2014 – 2017. E-ARK was an EC-funded pilot action project in the Competiveness and Innovation Programme 2007- 2013, Grant Agreement no. 620998 under the Policy Support Programme.

Since the scope of the E-ARK 2014-2017 DIP specification was linked to a reference implementation, specific Content Information Types, and product development with pilot actions it was a 100 pages long document. The scope of this E-ARK DIP Specification is not the same, the document has been shortened heavily and therefore we currently only have two authors credited. This does not mean that the current authors are the only ones behind this specification. We rely heavily on the work previously done.

The authors of this specification would like to thank all national archives, tool developers and other stakeholders who provided valuable knowledge about their requirements for information packages and feedback to this and previous versions of the specification.


# II. Contact & Feedback 
The E-ARK DIP specification is maintained by the Digital Information LifeCycle Interoperability Standard Board (DILCIS Board). For further information about the DILCIS Board or feedback on the current document please consult the website http://www.dilcis.eu/ or https://github.com/dilcisboard or contact us at <info@dilcis.eu>   

# III. Authors


| Name                             | Organisation                                       |
| -------------------------------- | -------------------------------------------------- |
| Anders Bo Nielsen                | Danish National Archives                           |
| Phillip Tømmerholt               | Danish National Archives                           |


# IV. Revision History

| Revision No. | Date       | Authors(s)                       | Organisation | Description                                                           |
|--------------|------------|----------------------------------|--------------|----------------------------|
| 1.0          | 20.12.2018 | Phillip Tømmerholt <br/>Anders Bo Nielsen | DNA | Review version             |
| 1.0.1        | 20.03.2019 | Phillip Tømmerholt <br/>Anders Bo Nielsen | DNA | Corrected typos            |
| 1.0.2        | 26.04.2019 | Phillip Tømmerholt <br/>Anders Bo Nielsen | DNA | Corrected typos            |
| 1.1.0        | 27.05.2019 | Phillip Tømmerholt <br/>Anders Bo Nielsen | DNA | Align with CSIP            |


# Introduction


## Scope and purpose

Key objectives of this E-ARK DIP specification are:

- To define a generic structure of the DIP format in a way that it is suitable for a wide variety of archival records, such as document and image collections, databases or geographical data.
- To recommend a set of metadata related to the structural and the access aspects of the DIP.

## Relations to other E-ARK specifications
The E-ARK DIP specification can be found in the following model (see Figure 1):

![Figure 1](./media/Fig1DIP.svg)


_Common Specification for Information Packages_

Common Specification for Information Packages (CSIP) identifies and standardises the common aspects of information packages (SIP/AIP/DIP) which are equally relevant and implemented by any of the functional entities of the overall digital preservation process (i.e. Ingest, Data Management, Archival Storage, Preservation Planning, Access etc). 
CSIP is a separate document as all the grey boxes are. Therefore, this E-ARK DIP specification does not aim at repeating the information presented there – only the information that is absolutely necessary to understand the DIP specification will be mentioned here. 

_SIP, AIP, and DIP Specification_

SIP, AIP, and DIP specifications are in some respects outlined to be "on the same level" in the hierarchical order of specifications, since they alle need to be compliant to the Common Specification for Information Packages.
But following the OAIS reference model, the above model can also be read from left to right since a DIP is *derived from one or more AIPs*. 
Therefore there are some cases where the DIP specification heavily relies on what is stated in the SIP and AIP specifications. 
Therefore, this E-ARK DIP specification does not aim at repeating the information presented there – only the information that is absolutely necessary to understand the DIP specification will be mentioned here.


_Content Information Type Specifications_

Content Information Type Specifications are content-dependent specifications which include detailed information on how content, metadata, and documentation for specific Content Information Types 
(for example ERMS or relational databases) is to be handled within the SIP, AIP and DIP. It is in these specifications where most implementation issues are dealt with. 

## Definition of a DIP

The OAIS reference model defines a DIP as:

> An Information Package, derived from one or more AIPs, and sent by Archives to the Consumer in response to a request to the OAIS. 


The definition of an E-ARK DIP is that it corresponds to a CSIP which is ready to be processed by its designated Access Software; if it is not suited for processing and rendering by its designated Access Software, it is not (yet) a DIP. 
This is a very generic, but handy, definition. To be more specific, an E-ARK DIP is: 

- an IP which is sent (or is ready to be sent) to the user in an Access environment; 
- supported by tools, i.e. can be rendered by Access Software.

First of all, the DIP looks like the AIP: It replicates the structure of the AIP from which it is derived. It also inherits metadata as well as the intellectual entities of the AIP. 
An E-ARK AIP may in its entirety therefore also be a E-ARK DIP, however in most cases it is necessary to convert from an AIP to a DIP.  The DIP allows for example for the inclusion of new DIP representation formats, which are more user-friendly than the AIP formats that are intended for long-term preservation purposes. 
It also allows for the updating of the metadata as well as for the addition of new metadata elements.  Representation Information, which is required for rendering and understanding the intellectual content, might also be added, and as a direct consequence, there may be a need for new folders and files, for example within the ‘Documentation’ folder.

# Structure 
The folder structure of an E-ARK DIP must comply with the requirements for the folder structure for a CSIP, see [Folder structure of the CSIP](http://earkcsip.dilcis.eu/#41-folder-structure-of-the-csip).

The CSIP folder structure and its requirements is visualised in the figure below:

![IP Folder Structure](./media/Fig2DIP.svg)

- Green boxes represent folders
- Red boxes represent files. 
- Boxes with full lines represent mandatory files/folders
- Boxes with dotted lines represent optional files/folders. 

As can be seen from the figure - the requirements for the folder structure for a CSIP is at a bare minimum and makes it possible to have several extra optional folders and files in a CSIP (see boxes with dotted lines). 
The first thing to be said about the E-ARK DIP structure in regard to CSIP structure is that an E-ARK DIP will always consist of some of those files and folders that are optional in the CSIP minimum structure. 
There must be data to disseminate. Since the definition of an E-ARK DIP is that it corresponds to a CSIP which is ready to be processed by its designated Access Software, this leaves the question as to which data 
in the CSIP should be chosen to be encompassed in the E-ARK DIP. 

It is possible that an AIP in its current state and in its entirety can be delivered to a Consumer as is and still be considered an E-ARK DIP. 
That E-ARK DIP can contain the submission representation, and one or more preservation representations. Often, however, the OAIS is interested in leaving out irrelevant data and metadata and only present the 
Consumer with the data and metadata that the Consumer is interested in. This could be isolated to the content in one single representation in an E-ARK AIP, or maybe only a portion of a single representation in an E-ARK AIP. Maybe even only one specific file. The point here is that a plethora of different E-ARK DIPs can be created out of an E-ARK AIP or several E-ARK AIPs.


# **​Content Information Types**

Content Information is *“A set of information that is the original target of preservation or 
that includes part or all of that information. It is an Information Object composed of its Content 
Data Object and its Representation Information*” according to the OAIS Reference Model.

A Content Information Type can therefore be understood as a category of Content Information, for example 
relational databases, scientific data, electronic records management systems, digitised maps, etc..

According to the Common Specification for Information Package it is possible to [create specifications for
Content Information Types](http://earkcsip.dilcis.eu/#61-content-information-type-specifications). It is within these specifications that requirements and descriptions related to the specific Content Information Type is described. The DIP specification can not describe how each Content Information Type should be disseminated and therefore the DIP specification sets out requirements on how Content Information Type specifications should handle DIP requirements.

- A Content Information Type specification should have a section which sole focus is on describing DIP requirements and/or recommendations
  -  The DIP section should describe how to read/edit access rights
  -  The DIP section should describe how to register access software
  -  The DIP section could mention and list relevant access software for the Content Information Type

  
# **​Metadata**

The DIP metadata is based upon the existing CSIP, E-ARK SIP and E-ARK AIP specifications.
The metadata descriptions provided in this document cover the three core metadata categories: 

- structural   (see METS)
- preservation (see PREMIS)
- descriptive  (see EAD)

It must be stated that the CSIP allows for and makes a disctinction between preservation metadata and descriptive metadata (or Descriptive Information according to OAIS).
One of the challenges when dividing metadata between preservation metadata and descriptive metadata is that the current metadata standards do not operate with the same distinction. Access rights information can for example both be stored in EAD (descriptive metadata) and in PREMIS (preservation metadata) or in METS.
This leaves the question - where should this access and dissementation information be registered? This E-ARK DIP specification describes two ways of using EAD and PREMIS for registering Access Rights and Access Software. These are possible ways and not yet recommendations. 


## METS

METS (Metadata Encoding and Transmission Standard) is a standard for encoding descriptive, administrative, and structural metadata expressed using the XML Schema Language.
The use of METS is mandatory if it must comply with CSIP. See CSIP for the general use of METS in information packages.

The differences between a METS instance for an E-ARK DIP vs an E-ARK AIP are small. Actually, most of the metadata differences between an AIP and a DIP are in the descriptive metadata or preservation metadata such as EAD and PREMIS.

The E-ARK DIP specification is limited to include one and only one representation from an AIP (for which many may exist).
This limitation is made to reduce the complexity of the DIP. Future, more complex E-ARK DIP specifications awaits implementations and experiences from this current specification.
The chosen representation is itself an E-ARK IP and therefore follows the same structure. This is reflected in the IP being migrated from an AIP to a DIP. Below is a broad overview of the METS file.


&nbsp;  | Elements    |           |           | Values                     |Comments
--------|-------------| ----------|-----------|----------------------------|---------------------
**mets**|             |           |           |                            |
&nbsp;  |**metsHdr**  |           |           |                            |
&nbsp;  |             |**agent**  |           |                            |software or archivist creating the DIP
&nbsp;  | **dmdSec**  |           |           |                            |
&nbsp;  |             |**mdRef**  |           |*EAD*                       |information about descriptive metadata files (e.g EAD) 
&nbsp;  | **amdSec**  |           |           |                            |
&nbsp;  |             |**mdRef**  |           |*PREMIS*                    |information about preservation metadata files (e.g PREMIS)
&nbsp;  | **fileSec** |           |           |                            |
&nbsp;  |             |**fileGrp**|           |*Common Specification root* |
&nbsp;  |             |           |**fileGrp**|*metadata*                  |
&nbsp;  |             |           |**fileGrp**|*representations*           | normally only one repr. in the DIP
&nbsp;  |             |           |**fileGrp**|*schemas*                   |
&nbsp;  |             |           |**fileGrp**|*documentation*             |
&nbsp;  |**structMap**|           |           |                            |
&nbsp;  |             | **div**   |           |*metadata*                  |
&nbsp;  |             | **div**   |           |*representations*           |mets pointer to mets file for the repr.
&nbsp;  |             | **div**   |           |*schemas*                   |
&nbsp;  |             | **div**   |           |*documentation*             |

In the following the major differences between an XML instance for METS for an E-ARK DIP vs an E-ARK AIP are listed.

**Node level: mets root**

| ID | Name & Location | Description & usage | Cardi&shy;nality & Level | E-ARK DIP requirement |
| -- | --------------- | ------------------- | ------------------- | --------------------- |
| <a name="CSIP1"></a>**CSIP1** | **Package Identifier** <br/> `mets/@OBJID` | The @OBJID attribute is mandatory, its value is a string identifier for the METS document. For the package METS document, this should be the name/ID of the package, i.e. the name of the package root folder. <br/> For a representation level METS document this value records the name/ID of the representation, i.e. the name of the top-level representation folder. | **1..1** <br/> MUST | The OBJID must change to reflect that the DIP is another information package |
| <a name="CSIP2"></a>**CSIP2** | **Content Category** <br/> `mets/@TYPE` | The @TYPE attribute MUST be used to declare the category of the content held in the package, e.g. book, journal, stereograph, video, etc.. Legal values are defined in a fixed vocabulary. When the content category used falls outside of the defined vocabulary the @TYPE value must be set to "OTHER" and the specific value declared in @csip:OTHERTYPE. The vocabulary will develop under the curation of the DILCIS Board as additional content information type specifications are produced. <br/> **See also:** <a href="#VocabularyContentCategory" >Content Category</a> | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP3"></a>**CSIP3** | **Other Content Category** <br/> `mets[@TYPE=OTHER]/@csip:OTHERTYPE` | When the @TYPE attribute has the value "OTHER" the @csip:OTHERTYPE attribute MUST be used to declare the content category of the package/representation. <br/> **See also:** <a href="#VocabularyContentCategory" >Content Category</a> | **0..1** <br/> SHOULD | No structural change from CSIP |
| <a name="CSIP4"></a>**CSIP4** | **Content Information Type Specification** <br/> `mets/@csip: CONTENTINFORMATIONTYPE` | Used to declare the Content Information Type Specification used when creating the package. Legal values are defined in a fixed vocabulary. The attribute is mandatory for representation level METS documents. The vocabulary will evolve under the care of the DILCIS Board as additional Content Information Type Specifications are developed. <br/> **See also:** <a href="#VocabularyContentInformationTypeSpecification" >Content information type specification</a> | **0..1** <br/> SHOULD |No structural change from CSIP |
| <a name="CSIP5"></a>**CSIP5** | **Other Content Information Type Specification** <br/> `mets[@csip:CONTENTINFORMATIONTYPE='OTHER'] /@csip:OTHERCONTENTINFORMATIONTYPE` | When the @csip:CONTENTINFORMATIONTYPE uses the value "OTHER" the @csip:OTHERCONTENTINFORMATIONTYPE must describe the content. | **0..1** <br/> MAY | No structural change from CSIP |
| <a name="CSIP6"></a>**CSIP6** | **METS Profile** <br/> `mets/@PROFILE` | The URL of the METS profile that the information package conforms with. | **1..1** <br/> MUST | Profile for DIP not made yet - Awaiting AIP profile | 


**Node level: metsHdr**

| ID | Name & Location | Description & usage | Cardi&shy;nality & Level | E-ARK DIP requirement  |
| -- | --------------- | ------------------- | ------------------- | ---------------------- |
| <a name="CSIP117"></a>**CSIP117** | **Package header** <br/> `mets/metsHdr` | General element for describing the package. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP7"></a>**CSIP7** | **Package creation date** <br/> `mets/metsHdr/@CREATEDATE` | @CREATEDATE describes the date of creation of the package. | **1..1** <br/> MUST |  DIP - The name of the agent (software) that created the DIP from the AIP |
| <a name="CSIP8"></a>**CSIP8** | **Package last modification date** <br/> `mets/metsHdr/@LASTMODDATE` | @LASTMODDATE is mandatory if the package has been modified. | **0..1** <br/> SHOULD | Change to creation date for DIP. The DIP is another and new information package |
| <a name="CSIP9"></a>**CSIP9** | **OAIS Package type information** <br/> `mets/metsHdr/@csip:OAISPACKAGETYPE` | @csip:OAISPACKAGETYPE is an attribute added by the CSIP for describing the type of the IP. <br/> **See also:** <a href="#VocabularyOAISPackageType" >OAIS Package type</a> | **1..1** <br/> MUST | The value must be "DIP"|
| <a name="CSIP10"></a>**CSIP10** | **Agent** <br/> `mets/metsHdr/agent` | One mandatory agent is used to describe the software used for creating the package. Other uses of agents are described in the own implementations extending profile. | **1..n** <br/> MUST | No structural change from CSIP |
| <a name="CSIP11"></a>**CSIP11** | **Agent role** <br/> `mets/metsHdr/agent[@ROLE='CREATOR']` | The role of the mandatory agent is “CREATOR”. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP12"></a>**CSIP12** | **Agent type** <br/> `mets/metsHdr/agent[@TYPE='OTHER']` | The type of the mandatory agent is “OTHER”. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP13"></a>**CSIP13** | **Agent other type** <br/> `mets/metsHdr/agent[@OTHERTYPE='SOFTWARE']` | The other type of the mandatory agent is “SOFTWARE”. <br/> **See also:** <a href="#VocabularyAgentOtherType" >Other agent type</a> | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP14"></a>**CSIP14** | **Agent name** <br/> `mets/metsHdr/agent/name` | The name of the mandatory agent is the name of the software tool which was used to create the IP. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP15"></a>**CSIP15** | **Agent additional information** <br/> `mets/metsHdr/agent/note` | The mandatory agent has a note providing the version information for the tool which was used to create the IP. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP16"></a>**CSIP16** | **Classification of the agent additional information** <br/> `mets/metsHdr/agent/note[@csip:NOTETYPE='SOFTWARE VERSION']` | The mandatory agent note is typed with the fixed value of "SOFTWARE VERSION". <br/> **See also:** <a href="#VocabularyNoteType" >Note type</a> | **1..1** <br/> MUST | No structural change from CSIP |



**Node level: dmdSec**

| ID | Name & Location | Description & usage | Cardi&shy;nality & Level | E-ARK DIP require&shy;ment  |
| -- | --------------- | ------------------- | ------------------- | ---------------------- |
| <a name="CSIP17"></a>**CSIP17** | **Descriptive metadata** <br/> `mets/dmdSec` | Must be used if descriptive metadata for the package content is available. Each descriptive metadata section (dmdSec) contains one description and thus is repeated when more descriptions are available. <br/> It is possible to transfer metadata in a package using just the descriptive metadata section and/or administrative metadata section. | **0..n** <br/> SHOULD | No structural change from CSIP |
| <a name="CSIP18"></a>**CSIP18** | **Descriptive metadata identifier** <br/> `mets/dmdSec/@ID` | An xml:id identifier for the descriptive metadata section (dmdSec) used for referencing inside the package. It must be unique within the package. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP19"></a>**CSIP19** | **Descriptive metadata creation date** <br/> `mets/dmdSec/@CREATED` | Creation date of the descriptive metadata in this section. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP20"></a>**CSIP20** | **Status of the descriptive metadata** <br/> `mets/dmdSec/@STATUS` | Indicates the status of the package using a fixed vocabulary. <br/> **See also:** <a href="#VocabularyStatus" >dmdSec status</a> | **0..1** <br/> SHOULD | Normally the status should be CURRENT |
| <a name="CSIP21"></a>**CSIP21** | **Reference to the document with the descriptive metadata** <br/> `mets/dmdSec/mdRef` | Reference to the descriptive metadata file located in the “metadata” section of the IP. | **0..1** <br/> SHOULD | No structural change from CSIP |
| <a name="CSIP22"></a>**CSIP22** | **Type of locator** <br/> `mets/dmdSec/mdRef[@LOCTYPE='URL']` | The locator type is always used with the value "URL" from the vocabulary in the attribute. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP23"></a>**CSIP23** | **Type of link** <br/> `mets/dmdSec/mdRef[@xlink:type='simple']` | Attribute used with the value “simple”. Value list is maintained by the xlink standard. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP24"></a>**CSIP24** | **Resource location** <br/> `mets/dmdSec/mdRef/@xlink:href` | The actual location of the resource. This specification recommends recording a URL type filepath within this attribute. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP25"></a>**CSIP25** | **Type of metadata** <br/> `mets/dmdSec/mdRef/@MDTYPE` | Specifies the type of metadata in the linked file. Values are taken from the list provided by the METS standard. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP26"></a>**CSIP26** | **File mime type** <br/> `mets/dmdSec/mdRef/@MIMETYPE` | The IANA mime type for the linked file. <br/> **See also:** <a href="#VocabularyIANAmediaTypes" >IANA media types</a> | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP27"></a>**CSIP27** | **File size** <br/> `mets/dmdSec/mdRef/@SIZE` | Size of the linked file in bytes. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP28"></a>**CSIP28** | **File creation date** <br/> `mets/dmdSec/mdRef/@CREATED` | The date the linked file was created. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP29"></a>**CSIP29** | **File checksum** <br/> `mets/dmdSec/mdRef/@CHECKSUM` | The checksum of the linked file. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP30"></a>**CSIP30** | **File checksum type** <br/> `mets/dmdSec/mdRef/@CHECKSUMTYPE` | The type of checksum following the value list in the standard which used for the linked file. | **1..1** <br/> MUST | No structural change from CSIP |


**Node level: admSec**


| ID | Name & Location | Description & usage | Cardinality & Level | E-ARK DIP requirement  |
| -- | --------------- | ------------------- | ------------------- | ---------------------- |
| <a name="CSIP31"></a>**CSIP31** | **Administrative metadata** <br/> `mets/amdSec` | If administrative / preservation metadata is available, it must be described using the administrative metadata section (amdSec) element. <br/> All administrative metadata is present in one amdSec element. <br/> It is possible to transfer metadata in a package using just the descriptive metadata section and/or administrative metadata section. | **0..1** <br/> SHOULD | No structural change from CSIP |
| <a name="CSIP32"></a>**CSIP32** | **Digital provenance metadata** <br/> `mets/amdSec/digiprovMD` | For recording information about preservation the standard PREMIS is used. It is mandatory to include one digiprovMD element for each piece of PREMIS metadata. <br/> The use if PREMIS in METS is following the recommendations in  <br/> 2017 version of PREMIS in METS Guidelines | **0..n** <br/> SHOULD | No structural change from CSIP |
| <a name="CSIP33"></a>**CSIP33** | **Digital provenance metadata identifier** <br/> `mets/amdSec/digiprovMD/@ID` | An xml:id identifier for the digital provenance metadata section (digiprovMD) used for referencing inside the package. It must be unique within the package. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP34"></a>**CSIP34** | **Status of the digital provenance metadata** <br/> `mets/amdSec/digiprovMD/@STATUS` | Indicates the status of the package using a fixed vocabulary. <br/> **See also:** <a href="#VocabularyStatus" >dmdSec status</a> | **0..1** <br/> SHOULD | No structural change from CSIP |
| <a name="CSIP35"></a>**CSIP35** | **Reference to the document with the digital provenance metdata** <br/> `mets/amdSec/digiprovMD/mdRef` | Reference to the digital provenance metadata file stored in the “metadata” section of the IP. | **0..1** <br/> SHOULD | No structural change from CSIP |
| <a name="CSIP36"></a>**CSIP36** | **Type of locator** <br/> `mets/amdSec/digiprovMD/mdRef[@LOCTYPE='URL']` | The locator type is always used with the value "URL" from the vocabulary in the attribute. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP37"></a>**CSIP37** | **Type of link** <br/> `mets/amdSec/digiprovMD/mdRef[@xlink:type='simple']` | Attribute used with the value “simple”. Value list is maintained by the xlink standard. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP38"></a>**CSIP38** | **Resource location** <br/> `mets/amdSec/digiprovMD/mdRef/@xlink:href` | The actual location of the resource. This specification recommends recording a URL type filepath within this attribute. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP39"></a>**CSIP39** | **Type of metadata** <br/> `mets/amdSec/digiprovMD/mdRef/@MDTYPE` | Specifies the type of metadata in the linked file. Values are taken from the list provided by the METS standard. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP40"></a>**CSIP40** | **File mime type** <br/> `mets/amdSec/digiprovMD/mdRef/@MIMETYPE` | The IANA mime type for the linked file. <br/> **See also:** <a href="#VocabularyIANAmediaTypes" >IANA media types</a> | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP41"></a>**CSIP41** | **File size** <br/> `mets/amdSec/digiprovMD/mdRef/@SIZE` | Size of the linked file in bytes. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP42"></a>**CSIP42** | **File creation date** <br/> `mets/amdSec/digiprovMD/mdRef/@CREATED` | Date the linked file was created. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP43"></a>**CSIP43** | **File checksum** <br/> `mets/amdSec/digiprovMD/mdRef/@CHECKSUM` | The checksum of the linked file. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP44"></a>**CSIP44** | **File checksum type** <br/> `mets/amdSec/digiprovMD/mdRef/@CHECKSUMTYPE` | The type of checksum following the value list in the standard which used for the linked file. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP45"></a>**CSIP45** | **Rights metadata** <br/> `mets/amdSec/rightsMD` | A simple rights statement may be used to describe general permissions for the package. Individual representations should state their specific rights in their representation METS file. <br/> Available standards include  <br/> RightsStatements.org <br/>  ,  <br/> Europeana rights statements info <br/> ),  <br/> METS Rights Schema <br/>  created and maintaned by the METS Board, the rights part of  <br/> PREMIS <br/>  as well as own local rights statements in use. | **0..n** <br/> MAY | No structural change from CSIP |
| <a name="CSIP46"></a>**CSIP46** | **Rights metadata identifier** <br/> `mets/amdSec/rightsMD/@ID` | An `xml:id` identifier for the rights metadata section (rightsMD) used for referencing inside the package. It must be unique within the package. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP47"></a>**CSIP47** | **Status of the rights metadata** <br/> `mets/amdSec/rightsMD/@STATUS` | Indicates the status of the package using a fixed vocabulary. <br/> **See also:** <a href="#VocabularyStatus" >dmdSec status</a> | **0..1** <br/> SHOULD | No structural change from CSIP |
| <a name="CSIP48"></a>**CSIP48** | **Reference to the document with the rights metadata** <br/> `mets/amdSec/rightsMD/mdRef` | Reference to the rights metadata file stored in the “metadata” section of the IP. | **0..1** <br/> SHOULD | No structural change from CSIP |
| <a name="CSIP49"></a>**CSIP49** | **Type of locator** <br/> `mets/amdSec/rightsMD/mdRef[@LOCTYPE='URL]` | The locator type is always used with the value "URL" from the vocabulary in the attribute. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP50"></a>**CSIP50** |  <br/> `mets/amdSec/rightsMD/mdRef[@xlink:type='simple]` | Attribute used with the value “simple”. Value list is maintained by the xlink standard. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP51"></a>**CSIP51** | **Resource location** <br/> `mets/amdSec/rightsMD/mdRef/@xlink:href` | The actual location of the resource. We  recommend recording a URL type filepath within this attribute. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP52"></a>**CSIP52** | **Type of metadata** <br/> `mets/amdSec/rightsMD/mdRef/@MDTYPE` | Specifies the type of metadata in the linked file. Value is taken from the list provided by the METS standard. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP53"></a>**CSIP53** | **File mime type** <br/> `mets/amdSec/rightsMD/mdRef/@MIMETYPE` | The IANA mime type for the linked file. <br/> **See also:** <a href="#VocabularyIANAmediaTypes" >IANA media types</a> | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP54"></a>**CSIP54** | **File size** <br/> `mets/amdSec/rightsMD/mdRef/@SIZE` | Size of the linked file in bytes. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP55"></a>**CSIP55** | **File creation date** <br/> `mets/amdSec/rightsMD/mdRef/@CREATED` | Date the linked file was created. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP56"></a>**CSIP56** | **File checksum** <br/> `mets/amdSec/rightsMD/mdRef/@CHECKSUM` | The checksum of the linked file. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP57"></a>**CSIP57** | **File checksum type** <br/> `mets/amdSec/rightsMD/mdRef/@CHECKSUMTYPE` | The type of checksum following the value list in the standard which used for the linked file. | **1..1** <br/> MUST | No structural change from CSIP |


**Node level: fileSec**

| ID | Name & Location | Description & usage | Cardinality & Level | E-ARK DIP requirement  |
| -- | --------------- | ------------------- | ------------------- | ---------------------- |
| <a name="CSIP58"></a>**CSIP58** | **File section** <br/> `mets/fileSec` | The transferred content is placed in the file section in different file group elements, described in other requirements. <br/> No more than one file section (fileSec) element should be present. <br/> It is possible to transfer just descriptive metadata and/or administrative metadata without files placed in this section. | **0..1** <br/> SHOULD | No structural change from CSIP |
| <a name="CSIP59"></a>**CSIP59** | **File section identifier** <br/> `mets/fileSec/@ID` | An xml:id identifier for the file section used for referencing inside the package. It must be unique within the package. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP60"></a>**CSIP60** | **Documentation file group** <br/> `mets/fileSec/fileGrp[@USE='Documentation']` | All documentation pertaining to the transferred content is placed in one or more file group elements with @USE attribute value "Documentation". <br/> **See also:** <a href="#VocabularyFileGrpAndStructMapDivisionLabel" >File group names</a> | **1..n** <br/> MUST | No structural change from CSIP |
| <a name="CSIP113"></a>**CSIP113** | **Schema file group** <br/> `mets/fileSec/fileGrp[@USE='Schemas']` | All XML schemas used in the information package should be referenced from one or more file groups with @USE attribute value "Schemas". <br/> **See also:** <a href="#VocabularyFileGrpAndStructMapDivisionLabel" >File group names</a> | **1..n** <br/> MUST | No structural change from CSIP |
| <a name="CSIP114"></a>**CSIP114** | **Representations file group** <br/> `mets/fileSec/fileGrp[@USE='Representations']` | A pointer to the METS document describing the representation or pointers to the content being transferred must be present in one or more file groups with the categorisation "Representations". <br/> **See also:** <a href="#VocabularyFileGrpAndStructMapDivisionLabel" >File group names</a> | **1..n** <br/> MUST | No structural change from CSIP |
| <a name="CSIP61"></a>**CSIP61** | **Reference to administrative metadata** <br/> `mets/fileSec/fileGrp/@ADMID` | If administrative metadata has been provided on the file group (fileGrp) level this attribute points to the correct administrative metadata section. | **0..1** <br/> MAY | No structural change from CSIP |
| <a name="CSIP62"></a>**CSIP62** | **Content Information Type Specification** <br/> `mets/fileSec/fileGrp/@csip:CONTENTINFORMATIONTYPE` | An added attribute which states the name of the content information type specification used to create the package. <br/> The vocabulary will evolve under the curation of the DILCIS Board as additional content information type specifications are developed. <br/> This attribute is mandatory when the file group @LABEL attribute value is "Representations". <br/> When the "Package type" value is "Mixed" and/or the file group describes a "Representation", then this element states the content information type specification used for the file group. <br/> **See also:** <a href="#VocabularyContentInformationTypeSpecification" >Content information type specification</a> | **0..1** <br/> SHOULD | No structural change from CSIP |
| <a name="CSIP63"></a>**CSIP63** | **Other Content Information Type Specification** <br/> `mets/fileSec/fileGrp[@csip:CONTENTINFORMATIONTYPE='OTHER']/@csip:OTHERCONTENTINFORMATIONTYPE` | When the @csip:CONTENTINFORMATIONTYPE uses the value "OTHER" the @csip:OTHERCONTENTINFORMATIONTYPE must state a value for the Content Information Type Specification used. | **0..1** <br/> MAY | No structural change from CSIP |
| <a name="CSIP64"></a>**CSIP64** | **Description of the use of the file group** <br/> `mets/fileSec/fileGrp/@USE` | The value in the @USE is the name of the whole folder structure to the data, e.g "Documentation", "Schemas", "Representations/preingest" or "Representations/submission/data". | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP65"></a>**CSIP65** | **File group identifier** <br/> `mets/fileSec/fileGrp/@ID` | An xml:id identifier for the file group used for referencing inside the package. It must be unique within the package. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP66"></a>**CSIP66** | **File** <br/> `mets/fileSec/fileGrp/file` | The file group (fileGrp) contains the file elements which describe the file objects. | **1..n** <br/> MUST | No structural change from CSIP |
| <a name="CSIP67"></a>**CSIP67** | **File identifier** <br/> `mets/fileSec/fileGrp/file/@ID` | A xml:id unique identifier for this file across the package. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP68"></a>**CSIP68** | **File mimetype** <br/> `mets/fileSec/fileGrp/file/@MIMETYPE` | The IANA mime type for the linked file. <br/> **See also:** <a href="#VocabularyIANAmediaTypes" >IANA media types</a> | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP69"></a>**CSIP69** | **File size** <br/> `mets/fileSec/fileGrp/file/@SIZE` | Size of the linked file in bytes. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP70"></a>**CSIP70** | **File creation date** <br/> `mets/fileSec/fileGrp/file/@CREATED` | Date the linked file was created. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP71"></a>**CSIP71** | **File checksum** <br/> `mets/fileSec/fileGrp/file/@CHECKSUM` | The checksum of the linked file. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP72"></a>**CSIP72** | **File checksum type** <br/> `mets/fileSec/fileGrp/file/@CHECKSUMTYPE` | The type of checksum following the value list in the standard which used for the linked file. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP73"></a>**CSIP73** | **File original identfication** <br/> `mets/fileSec/fileGrp/file/@OWNERID` | If an original ID for the file has been given by the owner it can be saved in this attribute. | **0..1** <br/> MAY | No structural change from CSIP |
| <a name="CSIP74"></a>**CSIP74** | **File reference to administrative metadata** <br/> `mets/fileSec/fileGrp/file/@ADMID` | If administrative metadata has been described for the file this attribute points to the file's administrative metadata. | **0..1** <br/> MAY | No structural change from CSIP |
| <a name="CSIP75"></a>**CSIP75** | **File reference to descriptive metadata** <br/> `mets/fileSec/fileGrp/file/@DMDID` | If descriptive metadata has been described per file this attribute points to the file's descriptive metadata. | **0..1** <br/> MAY | No structural change from CSIP |
| <a name="CSIP76"></a>**CSIP76** | **File locator reference** <br/> `mets/fileSec/fileGrp/file/FLocat` | The location of each external file must be defined by the file location (FLocat) element using the same rules as for referencing metadata files. All references to files should be made using the XLink href attribute and the file protocol using the relative location of the file. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP77"></a>**CSIP77** | **Type of locator** <br/> `mets/fileSec/fileGrp/file/FLocat[@LOCTYPE='URL']` | The locator type is always used with the value "URL" from the vocabulary in the attribute. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP78"></a>**CSIP78** | **Type of link** <br/> `mets/fileSec/fileGrp/file/FLocat[@xlink:type='simple']` | Attribute used with the value “simple”. Value list is maintained by the xlink standard. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP79"></a>**CSIP79** | **Resource location** <br/> `mets/fileSec/fileGrp/file/FLocat/@xlink:href` | The actual location of the resource. We  recommend recording a URL type filepath within this attribute. | **1..1** <br/> MUST | No structural change from CSIP |

**Node level: structMap**

| ID | Name & Location | Description & usage | Cardinality & Level | E-ARK DIP requirement |
| -- | --------------- | ------------------- | ------------------- | --------------------- |
| <a name="CSIP80"></a>**CSIP80** | **Structural description of the package** <br/> `mets/structMap` | The structural map (structMap) element is the only mandatory element in the METS standard. <br/> The structMap in CSIP describes the highest logical structure of the IP. <br/> Each METS file must include ONE structural map (structMap) element used exactly as described here.  <br/> Institutions can add their own additional custom structural maps as separate structMap sections. | **1..n** <br/> MUST | No structural change from CSIP |
| <a name="CSIP81"></a>**CSIP81** | **Type of structural description** <br/> `mets/structMap[@TYPE='PHYSICAL']` | The type attribute of the structural map (structMap) is set to value “PHYSICAL” from the vocabulary. <br/> **See also:** <a href="#VocabularyStructMapType" >Structural map typing</a> | **1..1** <br/> MUST | No structural change from CSIP. No change in value from CSIP|
| <a name="CSIP82"></a>**CSIP82** | **Name of the structural description** <br/> `mets/structMap[@LABEL='CSIP']` | The label attribute is set to value “CSIP” from the vocabulary. <br/> **See also:** <a href="#VocabularyStructMapLabel" >Structural map label</a> | **1..1** <br/> MUST |  No structural change from CSIP. No change in value from CSIP|
| <a name="CSIP83"></a>**CSIP83** | **Structural description identifier** <br/> `mets/structMap[@LABEL='CSIP']/@ID` | An `xml:id` identifier for the structural description (structMap) used for referencing inside the package. It must be unique within the package. | **1..1** <br/> MUST |  No structural change from CSIP. Possible change in value from CSIP|
| <a name="CSIP84"></a>**CSIP84** | **Main structural division** <br/> `mets/structMap[@LABEL='CSIP']/div` | The structural map consist of one main division. | **1..1** <br/> MUST | No structural change from CSIP|
| <a name="CSIP85"></a>**CSIP85** | **Main structural division identifier** <br/> `mets/structMap[@LABEL='CSIP']/div/@ID` | Mandatory, xml:id identifier must be unique within the package. | **1..1** <br/> MUST |  No structural change from CSIP. Possible change in value from CSIP|
| <a name="CSIP86"></a>**CSIP86** | **Main structural division label** <br/> `mets/structMap[@LABEL='CSIP']/div/@LABEL` | The package's top-level structural division (div) element must have an @LABEL attribute value identical to the package identifier, i.e. the same value as the mets/@OBJID attribute. | **1..1** <br/> MUST |  No structural change from CSIP. Value change from AIP ID to DIP ID.|
| <a name="CSIP88"></a>**CSIP88** | **Metadata division** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Metadata']` | The metadata referenced in the administrative and/or descriptive metadata section is described in the structural map with one sub division. <br/> When the transfer consist of only administrative and/or descriptive metadata this is the only sub division that occurs. | **1..1** <br/> MUST | No structural change from CSIP|
| <a name="CSIP89"></a>**CSIP89** | **Metadata division identifier** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Metadata']/@ID` | Mandatory, xml:id identifier must be unique within the package. | **1..1** <br/> MUST | No structural change from CSIP. Possible change in value from AIP|
| <a name="CSIP90"></a>**CSIP90** | **Metadata division label** <br/> `mets/structMap/div[@LABEL='CSIP']/div[@LABEL='Metadata']` | The metadata division (div) element in the package uses the value "Metadata" as the value for the attribute LABEL. <br/> **See also:** <a href="#VocabularyFileGrpAndStructMapDivisionLabel" >File group names</a> | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP91"></a>**CSIP91** | **Metadata division administrative metadata referencing** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Metadata']/@ADMID` | When there are administrative metadata and the amdSec is present, all administrative metadata MUST be referenced via the administrative sections different identifiers. <br/> All the different identifiers is named in the same @AMDID using space as the divider. | **0..1** <br/> SHOULD | No structural change from CSIP|
| <a name="CSIP92"></a>**CSIP92** | **Metadata division descriptive metadata referencing** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Metadata']/@DMDID` | When there are descriptive metadata and one or more dmdSec is present, all descriptive metadata MUST be referenced via the descriptive section identifiers. <br/> All the different identifiers is named in the same @DMDID using space as the divider. | **0..1** <br/> SHOULD | No structural change from CSIP|
| <a name="CSIP93"></a>**CSIP93** | **Documentation division** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Documentation']` | The documentation referenced in the file section file groups is described in the structural map with one sub division. | **0..1** <br/> SHOULD | No structural change from CSIP|
| <a name="CSIP94"></a>**CSIP94** | **Documentation division identifier** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Documentation']/@ID` | Mandatory, `xml:id` identifier must be unique within the package. | **1..1** <br/> MUST | No structural change from CSIP. Possible change in value from AIP|
| <a name="CSIP95"></a>**CSIP95** | **Documentation division label** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Documentation']` | The documentation division (div) element in the package uses the value "Documentation" from the vocabulary as the value for the attribute LABEL. <br/> **See also:** <a href="#VocabularyFileGrpAndStructMapDivisionLabel" >File group names</a> | **1..1** <br/> MUST |No structural change from CSIP. No change in value from CSIP|
| <a name="CSIP96"></a>**CSIP96** | **Documentation file referencing** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Documentation']/fptr` | All file groups contaning documentation described in the package are referenced via the relevant file group identifiers. One file group refrence per fptr-element | **0..n** <br/> MUST | No structural change from CSIP. Possible change in value from AIP|
| <a name="CSIP116"></a>**CSIP116** | **Documentation file group reference pointer** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Documentation']/fptr/@FILEID` | The pointer to the identifier for the "Documentation" file group. <br/> Related to the requirements CSIP60 which describes the "Documentation" file group and CSIP65 which describes the file group identifier. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP97"></a>**CSIP97** | **Schema division** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Schemas']` | The schemas referenced in the file section file groups are described in the structural map within a single sub-division. | **0..1** <br/> SHOULD |No structural change from CSIP|
| <a name="CSIP98"></a>**CSIP98** | **Schema division identifier** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Schemas']/@ID` | Mandatory, xml:id identifier must be unique within the package. | **1..1** <br/> MUST |No structural change from CSIP. Possible change in value from AIP|
| <a name="CSIP99"></a>**CSIP99** | **Schema division label** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Schemas']` | The schema division (div) element in the package uses the value "Schemas" from the vocabulary as the value for the attribute LABEL. <br/> **See also:** <a href="#VocabularyFileGrpAndStructMapDivisionLabel" >File group names</a> | **1..1** <br/> MUST | No structural change from CSIP. No change in value from CSIP|
| <a name="CSIP100"></a>**CSIP100** | **Schema file referencing** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Schemas']/fptr` | All file groups containing schemas described in the package are referenced via the relevant file group identifiers. One file group refrence per fptr-element | **0..n** <br/> MUST | No structural change from CSIP. Possible change in value from AIP| ?|
| <a name="CSIP118"></a>**CSIP118** | **Schema file group reference pointer** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Schemas']/fptr/@FILEID` | The pointer to the identifier for the "Schema" file group. <br/> Related to the requirements CSIP113 which describes the "Schema" file group and CSIP65 which describes the file group identifier. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP101"></a>**CSIP101** | **Content division** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Representations']` | When no representations are present the content referenced in the file section file group with @USE attribute value "Representations" is described in the structural map as a single sub division. | **0..1** <br/> SHOULD | No structural change from CSIP|
| <a name="CSIP102"></a>**CSIP102** | **Content division identifier** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Representations']/@ID` | Mandatory, xml:id identifier must be unique within the package. | **1..1** <br/> MUST |No structural change from CSIP. Possible change in value from AIP|
| <a name="CSIP103"></a>**CSIP103** | **Content division label** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Representations']/@LABEL` | The package's content division (div) element must have the @LABEL attribute value "Representations", taken from the vocabulary. <br/> **See also:** <a href="#VocabularyFileGrpAndStructMapDivisionLabel" >File group names</a> | **1..1** <br/> MUST | No structural change from CSIP. No change in value from CSIP|
| <a name="CSIP104"></a>**CSIP104** | **File division file referencing** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Representations']/fptr` | All file groups containing content described in the package are referenced via the relevant file group identifiers. One file group refrence per fptr-element | **0..n** <br/> MUST |No structural change from CSIP. Possible change in value from AIP|
| <a name="CSIP119"></a>**CSIP119** | **Content division file group references** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='Representations']/fptr/@FILEID` | The pointer to the identifier for the "Representations" file group. <br/> Related to the requirements CSIP114 which describes the "Representations" file group and CSIP65 which describes the file group identifier. | **1..1** <br/> MUST |No structural change from CSIP|
| <a name="CSIP105"></a>**CSIP105** | **Representation division** <br/> `mets/structMap[@LABEL='CSIP']/div/div` | When a package consists of multiple representations, each described by a representation level METS.xml document, there is a discrete representation div element for each representation. <br/> Each representation div references the representation level METS.xml document, documenting the structure of the package and its constituent representations. | **0..1** <br/> SHOULD | Structural change from CSIP from 0..n to 0..1. The DIP must only contain one representation. The AIP to DIP migration choses which representation to migrate from the AIP to the DIP|
| <a name="CSIP106"></a>**CSIP106** | **Representations division identifier** <br/> `mets/structMap[@LABEL='CSIP']/div/div/@ID` | Mandatory, xml:id identifier must be unique within the package. | **1..1** <br/> MUST | No structural change from CSIP. Possible change in value from AIP|
| <a name="CSIP107"></a>**CSIP107** | **Representations division label** <br/> `mets/structMap[@LABEL='CSIP']/div/div[@LABEL='CSIP']` | The package's representation division (div) element @LABEL attribute value must be the path to the representation level METS document. <br/> This requirement gives the same value to be used as the requirement named "File group identifier" (CSIP64) <br/> **See also:** <a href="#VocabularyFileGrpAndStructMapDivisionLabel" >File group names</a> | **1..1** <br/> MUST | No structural change from CSIP. Possible change in value from AIP|
| <a name="CSIP108"></a>**CSIP108** | **Representations division file referencing** <br/> `mets/structMap/div/div/mptr/@xlink:title` | The file group containing the files described in the package are referenced via the relevant file group identifier. <br/> Related to the requirements CSIP114 which describes the "Representations" file group and CSIP65 which describes the file group identifier. | **1..1** <br/> MUST | No structural change from CSIP. Possible change in value from AIP|
| <a name="CSIP109"></a>**CSIP109** | **Representation METS pointer** <br/> `mets/structMap/div/div/mptr` | The division (div) of the specific representation includes one occurrence of the METS pointer (mptr) element, pointing to the appropriate representation METS file. | **1..1** <br/> MUST | No structural change from CSIP |
| <a name="CSIP110"></a>**CSIP110** | **Resource location** <br/> `mets/structMap/div/div/mptr/@xlink:href` | The actual location of the resource. We  recommend recording a URL type filepath within this attribute. | **1..1** <br/> MUST | No structural change from CSIP. Possible change in value from AIP|
| <a name="CSIP111"></a>**CSIP111** | **Type of link** <br/> `mets/structMap/div/div/mptr[@xlink:type='simple']` | Attribute used with the value “simple”. Value list is maintained by the xlink standard. | **1..1** <br/> MUST | No structural change from CSIP. No change in value from CSIP|
| <a name="CSIP112"></a>**CSIP112** | **Type of locator** <br/> `mets/structMap/div/div/mptr[@LOCTYPE='URL']` | The locator type is always used with the value "URL" from the vocabulary in the attribute. | **1..1** <br/> MUST | No structural change from CSIP. No change in value from CSIP|
## PREMIS
PREMIS (Preservation Metadata: Implementation Strategies) is a standard that mainly caters for long-term preservation and technical usability, which for example is used to facilitate a range of preservation strategies including migration and emulation.
From an Access perspective, PREMIS especially satisfies the requirements pertaining to the recording of Representation Information. It is practical to state in a formalised and consistent way how the Access Software should behave and where it should look when dealing with different pieces of information, such as which representation formats are included in the DIP. 

### ​Metadata regarding Representations and Access Software
In PREMIS, a representation is a "set of files, including structural metadata, needed for a complete and reasonable rendition of an Intellectual Entity." See  [PREMIS Editorial Committee (2015). "PREMIS Data Dictionary for Preservation Metadata", p.8](http://www.loc.gov/standards/premis/v3/premis-3-0-final.pdf).

One of the core concepts in PREMIS is the above formulated definition of a representation, but it is also important to note that the CSIP structure also incorporates physical management of different representations. When implementing PREMIS in CSIPs one must therefore choose if there must exist PREMIS files at representation level or at root level only (see CSIP) and one must also choose how fine-grained each description should be.

To enable rendition, three pieces of information are needed in PREMIS: One identifying the representation to be rendered; one identifying the software to enable this; and one establishing a relationship between the two.

The descriptions below therefore show how to:
1.  Describe which DIP representation format is contained in the DIP (description 1 below);
2.  Describe which piece(s) of Access Software is/are needed to render a specific DIP representation format. Several pieces of software may indeed be needed (description 2 below);
3.  Describe the relationship between the DIP representation format and its Access Software (description 3 below).

#### Description 1 - The description of DIP representation formats
In order to describe the specific DIP representation format the semantic component "1.4 significantProperties" is used. An example is:
```xml
<object xsi:type="representation">
   <objectIdentifier>
      <objectIdentifierType>filepath\</objectIdentifierType>
         <objectIdentifierValue>xlink:href=\"representations\\AVID.SA.18006.rep0\"\</objectIdentifierValue>
   </objectIdentifier>
   <significantProperties>
      <significantPropertiesType>DIP representation format\</significantPropertiesType>
         <significantPropertiesValue>SIARD2\</significantPropertiesValue>
   </significantProperties>
<!-- PREMIS file continues but further elements left out in this example-->                     
</object>
```
Note that the object type is "representation" and that the objectIdentifierType value is "filepath", which according to the AIP specification is an IP scope value. The objectIdentifierValue is the filepath to the representation folder or could be a filepath to a file.

#### Description 2 - The description of Access Software
In PREMIS 3.0 a description of an environment has become an object itself, so that both non-environmental objects and environmental objects exist. Access Software is therefore an environmental object which per default is an intellectual entity. 
The semantic unit "1.9 environmentFunction" is conceived to describe the environment object(s) with different levels of granularity. It is suggested to use [the vocabulary from Library of Congress](http://id.loc.gov/vocabulary/preservation/environmentFunctionType.html). 
The semantic unit "1.10 environmentDesignation" is used for information identifying the environment by using human-readable language which can be expected to be understood outside of a digital repository.

See the example which follows this vocabulary:


```xml
<object xsi:type="intellectualEntity">
     <objectIdentifier>
         <objectIdentifierType>local</objectIdentifierType>
         <objectIdentifierValue>DBVTK</objectIdentifierValue>
     </objectIdentifier>
     <environmentFunction>
         <environmentFunctionType>software</environmentFunctionType>
         <environmentFunctionLevel>1</environmentFunctionLevel>
     </environmentFunction>
     <environmentFunction>
         <environmentFunctionType>software application</environmentFunctionType>
         <environmentFunctionLevel>2</environmentFunctionLevel>
     </environmentFunction>
    <environmentDesignation>
	<environmentName>Database Visualization Toolkit</environmentName>
	<environmentVersion>2.4.1</environmentVersion>
	<environmentDesignationNote>Lightweight web viewer for relational databases, specially if preserved in SIARD 2, that uses SOLR as a backend, and allows browsing, search, and export. Documentation at github.com/eark-project/software/DBVTK</environmentDesignationNote>
	</environmentDesignation>
</object>
```

#### Description 3 - The description of the relation between the representations and the Access Software

In order to establish a connection between the DIP representation format to be rendered and the Access Software to render it, it is necessary to use the semantic unit "1.13 relationship". The relationship element can bind both non-environmental objects together with environmental objects and it can bind environmental objects together with other environmental objects. The following example shows how the DIP representation format can be related to the Access Software:


```xml
<object xsi:type="representation">   
   <objectIdentifier> 
      <objectIdentifierType>filepath</objectIdentifierType>
      <objectIdentifierValue>xlink:href="representations\AVID.SA.18006.rep0"</objectIdentifierValue>
   </objectIdentifier>
   <significantProperties>
      <significantPropertiesType>DIP representation format</significantPropertiesType>
      <significantPropertiesValue>SIARD2</significantPropertiesValue>
   </significantProperties>
   <!-- The following is the relation between the software and the DIP representation --> 
   <relationship>
       <relationshipType>dependency</relationshipType> 
       <relationshipSubType>requires</relationshipSubType>
       <relatedObjectIdentifier>
           <relatedObjectIdentifierType>local</relatedObjectIdentifierType>
           <relatedObjectIdentifierValue>DBVTK</relatedObjectIdentifierValue>
         </relatedObjectIdentifier>
       <relatedEnvironmentPurpose>render</relatedEnvironmentPurpose> 
   </relationship>
</object>
```

As can be seen above the nature of the relationship, \<relationshipType\> is used (value, e.g. 'dependency'); intimately linked to this is also the indication of a \<relationshipSubType\>, e.g. 'requires'.

In order to identify the Access Software, which is used to render the representation, the \<relatedObjectIdentifier\> is employed; and the \<relatedEnvironmentPurpose\> gives us a hint about what the purpose is (here: to 'render').

Since it is not always possible to render the DIP representation formats with one piece of Access Software, it can be necessary to model software dependencies and sequences between several pieces of software in PREMIS.

## Descriptive metadata - e.g. EAD

Descriptive metadata are used to describe the intellectual contents of archival holdings, and they support finding and understanding individual information packages. The E-ARK DIP allows for the inclusion of any kind of descriptive metadata. 
The E-ARK project reached the conclusion that EAD was one of the most used. See the full report
[D3.1 E-ARK Report on Available Best Practices](http://www.eark-project.com/resources/project-deliverables/6-d31-e-ark-report-on-available-best-practices). A common EARK EAD guideline is yet to be developed. But for information purposes and since the previous DIP specification described a way to register Access Rights Information the text is given here:

### Access restrictions
OAIS states:
> Access Rights Information: The information that identifies the access restrictions pertaining
> to the Content Information, including the legal framework, licensing terms, and access control.
> It contains the access and distribution conditions stated within the Submission Agreement,
> related to both preservation (by the OAIS) and final usage (by the Consumer).
> It also includes the specifications for the application of rights enforcement measures. 

The E-ARK DIP specification does not require that access rights are stored in a specific way since different metadata standards
can be applied differently to different Content Information Types. See Content Information Types. 
Since it is possible to have different metadata information in the metadata folder it is recommended to systematically control where access rights metadata are stored. For example access rights metadata can be stored in both EAD and in PREMIS.

The \<accessrestrict> tag is "An element for information about conditions that affect the availability of the materials being described." See [EAD3](http://www.loc.gov/ead/EAD3taglib/index.html\#elem-accessrestrict).
The Access Rights Information that concerns the end-user has to be available in EAD - not in PREMIS - and \<accessrestrict> is used for this purpose. The reasons being:
It should be possible to find the Access Rights Information in one place and one place only, namely in the descriptive metadata, which, per default, are the metadata displayed in the Access Software (Finding Aids and different viewers). EAD supports the description of potentially very complex hierarchical levels of an IP and can therefore if necessary differentiate access restrictions all the way down to the individual file level. Descriptive metadata are very often added upon Ingest and Finding Aids can thus immediately be populated with this kind of information.
The \<p> tag in \<accessrestrict> is repeatable and can be used in the following way:

**EAD example of \<accessrestrict>**
```xml
<accessrestrict>
 <p>Restricted</p>
 <p>75</p>
 <p>...</p>
</accessrestrict>
```
If the value of the first \<p> is "Restricted" or "" (empty - which also means that it is restricted) the tool will look for a second \<p> which specifies the restriction period. "Unrestricted" means that the IP is immediately accessible. The second \<p> can contain any text, for example \<p>This IP is available 20 years from November 14 2002\</p>.
Note that the EAD3 schema validates even without the \<head> tag inside \<accessrestrict>.
For more complex scenarios, it is possible to use \<chronlist> as follows:

EAD example of \<chronlist>
```xml
<accessrestrict>
 <chronlist>
  <chronitem>
   <daterange>
    <fromdate>01.01.2016</fromdate>
    <todate>01.01.2041</todate>
   </daterange>
   <event>
    <list>
     <item>type of the restriction (e.g. personal data)</item>
     <item>duration of the restriction in years (e.g. 25 years)</item>
     <item>source of the restriction (e.g. Public access law AvTS §7)</item>
     <item>additional description of the access restriction (e.g. The content can be made public if personal data is removed from the DIP)</item>
    </list>
   </event>
  </chronitem>
 </chronlist>
</accessrestrict>
```

## Bibliography
Bredenberg, Karin, Björn Skog, Anders Bo Nielsen, Kathrine Hougaard Edsen Johansen, Alex Thirifays,
Sven Schlarb, Andrew Wilson, et al. 2018. Common Specification for Information Packages (Csip). ERCIM
News. 2.0.0-DRAFT ed. Digital Information LifeCycle Interoperability Standard Board (DILCIS Board).
http://earkcsip.dilcis.eu.

OAIS. 2012. Reference Model for an Open Archival Information System. CCSDS 650.0-M-2 (Magenta
Book). CCSDS - Consultative Committee for Space Data Systems. http://public.ccsds.org/publications/
archive/650x0b1.pdf.

PREMIS. 2017. PREMIS Data Dictionary for Preservation Metadata, Version 3.0. The Library of Congress.
https://www.loc.gov/standards/premis/v3/index.html.

