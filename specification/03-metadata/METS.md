# ​3.1.2​ Metadata in the DIP

The DIP metadata is based upon the existing common, SIP and AIP specifications. The metadata descriptions provided in this document cover the three core metadata categories: structural[^43] (METS[^44]); preservation[^45] (PREMIS[^46]); and descriptive[^47] (EAD[^48])).

[^43]: Structural metadata describes the physical and/or logical structure of digital resources. The standard that E-ARK recommends for structural metadata is METS.

[^44]: Metadata Encoding and Transmission Standard. The METS schema is a standard for encoding descriptive, administrative, and structural metadata regarding objects within a digital library, expressed using the XML schema language of the World Wide Web Consortium. The standard is maintained in the Network Development and MARC Standards Office of the Library of Congress, and is being developed as an initiative of the Digital Library Federation - <http://www.loc.gov/standards/mets/>

[^45]: Preservation metadata is an essential component of most digital preservation strategies. Preservation metadata is information that supports and documents the digital preservation process - https://en.wikipedia.org/wiki/Preservation\_metadata
The standard that E-ARK recommends for preservation metadata is PREMIS.

[^46]: The Preservation Metadata: Implementation Strategies. The PREMIS Data Dictionary for Preservation Metadata is the international standard for metadata to support the preservation of Digital Objects and ensure their long-term usability - http://www.loc.gov/standards/premis/

[^47]: Also named Descriptive Information in OAIS: The set of information, consisting primarily of Package Descriptions, which is provided to Data Management to support the finding, ordering, and retrieving of OAIS information holdings by Consumers - <http://public.ccsds.org/publications/archive/650x0m2.pdf>.
The standard that E-ARK recommends for descriptive metadata is EAD.

[^48]: Encoded Archival Description. A non-proprietary de facto standard for the encoding of Finding Aids for use in a networked (online) environment. EAD allows the standardization of collection information in Finding Aids within and across repositories. EAD3 About [[http://www.loc.gov/ead/eadabout.html]{.underline}](http://www.loc.gov/ead/eadabout.html).

The DIP is based on the AIP, and structural and preservation metadata are thus always - slightly modified - present in the DIP. The METS file is in the root folder, and its schema file (mets.xsd) is in the /schemas folder. The greater part of the Access Software assumes the existence of an EAD and a PREMIS file in the root /metadata/descriptive folder and in the root /metadata/preservation/ folder respectively. Consequently it is also assumed that pertaining schema files (ead3.xsd; premis.xsd) are present in the /schemas folder.

## ​3.1.2.1​ METS

METS (Metadata Encoding and Transmission Standard) is a standard for encoding descriptive, administrative, and structural metadata expressed using the XML Schema Language.

The XML Schema for METS for an E-ARK DIP is the same XML schema as for an E-ARK AIP (i.e. the same mets.xsd file[^49]).

[^49]: Over time the METS versions will change and therefore they may be a difference in version between the AIP and the DIP, but we assume that the AIP will be migrated and therefore that the difference will not occur or at least be small.

The XML instance for METS for an E-ARK DIP is based on the same instance as an E-ARK AIP (i.e. different mets.xml files).

The differences between a METS instance for an E-ARK DIP vs an E-ARK AIP are small. Actually, most of the metadata differences between an AIP and a DIP are in the PREMIS and the EAD metadata.

The DIP specification is limited to include one and only one representation from an AIP (for which many may exist). The chosen representation is itself an E-ARK IP and therefore follows the same structure. This is reflected in the IP being migrated from an AIP to a DIP. Below is a broad overview of the METS file.

**Table 3 - Broad overview of the METS file**

&nbsp;  | Elements    |           |           | Values                     |Comments
--------|-------------| ----------|-----------|----------------------------|---------------------
**mets**|             |           |           |                            |
&nbsp;  |**metsHdr**  |           |           |                            | 
&nbsp;  |             |**agent**  |           |                            |software or archivist creating the DIP
&nbsp;  | **dmdSec**  |           |           |                            |
&nbsp;  |             |**mdRef**  |           | *EAD*                      |information about the EAD file
&nbsp;  | **amdSec**  |           |           |                            |
&nbsp;  |             |**mdRef**  |           |*PREMIS*                    |information about the PREMIS file
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

**Table 4 - Differences between the AIP METS and the DIP METS on node level: mets**
**Node level: mets**

**Element / Attribute**|**Cardi&shy;nality**|**Description and usage in Common specification**| **Change for DIP**
----------------------|---------------|-------------------------------------------------|-------------------
mets     | 1..1 | The root level element that is required in all METS documents| No change  
\@ID     | 0..1 | Optional, no further requirements | No change
\@OBJID  | 1..1 | Mandatory in this specification. It is recommended that it be the same as the name or ID of the package (the name of the root folder). The OBJID must meet the Common Specification requirement of being unique at least across the repository | Change the value of the attribute OBJID is changed to a new value reflecting the change in the IP from an AIP to a DIP.
\@LABEL  | 0..1 | Optional, if used should be filled with a human-readable description of the package | Change - Recommended to be "METS file describing the DIP matching the OBJID"                                              |
\@TYPE   | 1..1 | Mandatory in this specification. The TYPE attribute must be used for identifying the type of the package (genre), for example ERMS, RDBMS, digitised construction plans. However, there is no fixed vocabulary and as such implementers are welcome to use values most suitable for their needs. | No change    
\@CONTENTTYPE&shy;SPECIFICATION | 0..1 | An attribute added by this specification. It describes which content information type specification is used for the content. Values of the attribute are fixed in the following vocabulary: SMURFERMS * SMURFSFSB * SIARD1 * SIARD2  SIARDDK * GeoVectorGML * GeoRasterGeotiffNB The vocabulary is extensible as additional content information type specifications are developed. | Change to one of these: SMURFERMS, SMURFSFSB, SIARD1 SIARD2 SIARDDK, OLAPCube, GeoVectorGML GeoRasterGeotiff
\@PROFILE | 1..1 | Mandatory in this specification. The PROFILE attribute has to have as its value the URL of the official Common Specification METS Profile. | No change        

**Table 5 - Differences between the AIP METS and the DIP METS on node level: metsHDR**
**Node level: metsHdr** 

|  Element/ Attribute | Cardi&shy;nality | Description and usage |  Change for DIP 		        |
|---------------------|-------------|-----------------------|-----------------------------|
| metsHdr  |0..1|Element for describing the package itself  |  			  			 		        
| @ID 		 |0..1|Optional, no further requirements | No change |
| @ADMID 	 |0..1|Optional, referring to the appropriate administrative metadata section, if used for metadata about the package as a whole. |No	change|
| @CREATEDATE |1..1|Mandatory, the date of creation of the package | Change	to creation date for DIP|
| @LASTMODDATE|0..n|Mandatory if relevant (in case the package has been modified)|Change to date of modification, if DIP has been created in several steps.|
| @RECORDSTATUS|0..1|Optional, no further requirements|No change|
| @PACKAGETYPE|1..1|An attribute added by the Common Specification for describing the type of the IP. The vocabulary to be used contains values:SIP, AIP, DIP, AIU, AIC. The vocabulary is managed by the DAS Board and will be updated when required.| Change	to DIP |
|agent|1..n|The metsHdr must include at least one agent describing the software which has been  to create the package (TYPE=”OTHER” ROLE=”CREATOR” OTHERTYPE=”SOFTWARE”).Description of all other agents is optional.|  			  			 	|
| agent/@ID|0..1|An ID for the agent.|No change|
| agent/@ROLE|1..1|The role of the agent. The Common Specification requires describing at least one agent with the agent/@ROLE value “CREATOR”. For other (optional) occurrences of agent this attribute shall use a value from the fixed list provided by METS.|No change|
| agent/ @OTHERROLE|0..1|A textual description of the role of the agent in case the value of agent/@ROLE is “OTHER”.|No change|
| agent/ @TYPE|0..1|The Common Specification requires that at least one instance of the agent element includes the agent/@TYPE attribute with the value “OTHER”. In other occurrences of the agent element the attribute is optional. If used, values defined in official METS documentation shall be followed (“individual”, “organisation”, “other").|No change|
| agent/ @OTHERTYPE|0..1|The Common Specification requires that at least one instance of the agent element includes the agent/ @OTHERTYPE attribute with the value “SOFTWARE”. In other occurrences this attribute shall only be used in case the value of agent/@TYPE is “OTHER”.|No change|
| agent/ name|1..1|The name of the agent. In the Common Specification occurrence of the agent element this element must provide the name of the software tool which was used to create the IP. |Change to name of the agent that created the DIP from the AIP|
| agent/ note|0..1|Additional information about the agent. We recommend using this element toprovide version information for the tool which was used to create the IP. | Change to version no. for the DIP creation software.|
| altRecordID|0..n|A container for an alternative ID for the package content.|No change|
| altRecordID/ @ID|0..1|An ID for the altRecordID element within the METS document.|No change|
| altRecordID/ @TYPE|0..1|Used to describe the type of ID assigned. It is recommended to use the Library of Congress vocabulary for this element when used.|No change|
| metsDocumentID |0..1|A unique identifier for the METS document itself.|No change|
| metsDocumentID/ @ID|0..1|The ID of the metsDocumentID element.|No change|
| metsDocumentID/ @TYPE|0..1|The type of the identifier assigned to the element.|No change|

**Table 6 - Differences between the AIP METS and the DIP METS on node level: dmdsec**
**Node level: dmdSec**

| Element/ Attribute|Cardi&shy;nality|Description and usage|Change for DIP|
|-------------------|-----------|---------------------|--------------|
|dmdSec|0..n|Must be used if descriptive metadata about the package content is available. NOTE: According to official METS documentation each metadata section must describe one and only one set of metadata. As such, if 	implementers want to include multiple occurrences of descriptive metadata into the package this must be done by repeating the whole dmdSec element for each individual metadata. | No change. The DIP spec. assumes the EAD is in the AIP. The EAD is needed to find the AIP with the desired content.|
|@ID|1..1|Mandatory, identifier must be unique within the package|No change|
|@GROUPID|0..1|Can be used to group together different metadata sections.|No change|
|@ADMID|0..1|In case administrative (provenance) metadata is available and described within METS about changes to the descriptive metadata, this element must reference the appropriate ID of the administrative metadata section. |No change|
|@CREATED|1..1|Required by the Common Specification. Creation date of the metadata in this section, needed to track changes to metadata files.|No change|
|@STATUS|0..1|Status of the metadata. Recommended for use to indicate currency of package. If used it is recommended to use one of the two values “SUPERSEDED” or “CURRENT”. |No change|
|/mdRef|0..1|Reference to the descriptive metadata file stored in the “metadata” folder of the IP. In each occurrence of the dmdSec exactly one of the elements mdRef or mdWrap must be present. The Common Specification recommends the use of mdRef over mdWrap |  			  			 		        |
|@ID|0..1|Unique ID for the mdRef section within the METS document.|No change|
|@MIMETYPE|0..1|The IANA media type for the external file.|No change|
|@LABEL|0..1|A name for the referenced file.|No change|
|@XPTR|0..1|Locates the point within a file to which the mdRef element refers, if applicable, using any valid XPointer scheme.|	No change|
|@LOCTYPE|1..1|Specifies the locator type used in the xlink:href which points to the file.|No change|
|@OTHERLOCTYPE|0..1|Required when mdRef/@LOCTYPE=“OTHER”.|No change|
|@MDTYPE|1..1|Specifies the type of metadata in the linked file. Values should be taken from the METS list provided. |No change|
|@MDTYPEVERSION|0..1|The version of the metadata type described in MDTYPE |No change|
|@OTHERMDTYPE|0..1|The type of metadata when MDTYPE=”OTHER”|No change|
|@SIZE|0..1|Size of linked file in bytes |No change|
|@CREATED|0..1|Date the linked file was created|No change|
|@CHECKSUM|0..1|The checksum of the linked file|No change|
|@CHECKSUMTYPE|0..1|The type of checksum used for calculating the checksum of the linked file|No change|
|/mdWrap|0..1|Wrapper for descriptive metadata embedded into the METS document. In each occurrence of the dmdSec exactly one of the elements mdRef or mdWrap must be present. The Common Specification recommends the use of mdRef over mdWrap|No change|
|@ID|0..1|Unique ID for the mdWrap section within the METS document.|No change|
|@MIMETYPE|0..1|The IANA mime type for the wrapped metadata.|No change|
|@LABEL|0..1|A name for the associated metadata.|No	change|
|@MDTYPE|1..1|Specifies the type of embedded metadata. Values should be taken from the METS list provided.|No change|
|@MDTYPEVERSION|0..1|The version of the metadata type described in MDTYPE|No change|
|@OTHERMDTYPE|0..1|The type of metadata when MDTYPE=”OTHER”|Nochange 		        |
|@SIZE|0..1|Size of associated metadata in bytes|No change|
|@CREATED|0..1|Date the embedded metadata was created|No change|
|@CHECKSUM|0..1|The checksum of the wrapped content|No change|
|@CHECKSUMTYPE|0..1|The type of checksum used for calculating the checksum of the embedded metadata|No change|
|/binData|0..1|A wrapper element to contain Base64 encoded metadata|No change|
|/xmldata|0..1|A wrapper element to contain XML encoded metadata|No change|

**Table 7 - Differences between the AIP METS and the DIP METS on node level: amdsec** 
**Node level: amdSec**

|Element/ Attribute|Cardi&shy;nality|Description and usage|Change for DIP|
|-----------------|------------|---------------------|---------------|
|amdSec|0..n|In case administrative / preservation metadata is available, it must be described using the amdSec element. 		          |Mandatory for DIP|
|@ID|0..1|Unique ID for the amdSec within the METS document|No change|
|digiprovMD|0..n|The Common Specification recommends the use of PREMIS metadata for recording information about preservation events. If used, PREMIS metadata must appear in a digiprovMD element, either embedded or linked. It is mandatory to include one 			digiprovMD element for each external file in the “metadata/preservation” folder, or for each embedded set of PREMIS metadata.|The DIP spec. assumes that a PREMIS file is updated or created during the AIP to DIP migration|
|techMD|0..n|The use of techMD is not recommended. Instead, detailed technical metadata should be included into or referenced from appropriate PREMIS files|No change|
|rightsMD|0..n|Optional. The Common Specification recommends including a simple rights statement which describes the overall access status of the package with the following values: Open, Closed, Partially closed, Not known. However, the exact schema and element is up to individual implementations to decide |No change|
|sourceMD|0..n|Optional, no further requirements| No change|

**Table 8 - Available attributes**
The following attributes are available for use with each of the four specific metadata areas listed above (xxx below stands for amdSec/digiprovMD, amdSec/techMD, amdSec/rightsMD and amdSec/sourceMD).

|Element/ Attribute|Cardi&shy;nality|Description and usage|Change for DIP|
|-----------------|------------|---------------------|---------------|
|xxx/ @ID|1..1|Mandatory for each of the four elements amdSec/digiprovMD, amdSec/techMD, amdSec/rightsMD and amdSec/sourceMD. Identifier must be unique within the package |No change|
|xxx/@GROUPID | 0..1 | Optional, no further requirements | No change |
|xxx/ @ADMID | 0..1 | In case administrative (provenance) metadata is available and described within METS about changes to the metadata occurrence described here, this element must reference the appropriate ID of the administrative metadata section. | No change |
|xxx/ @CREATED | 0..1 | Optional, no further requirements | No change |
|xxx/ @STATUS | 0..1 | Recommended for describing currency of metadata. If used, must include one of the two values “superseded” or “current” | No change |

**Table 9 - Differences between the AIP METS and the DIP METS on node level: filesec** 
**Node level: filesec**

|Element/ Attribute|Cardi&shy;nality|Description and usage|Change for DIP|
|-----------------|------------|---------------------|---------------|
| fileSec | 0..1 | Recommended to include one fileSec element in each METS file | No change |
| @ID | 0..1 | Recommended. The identifier must be unique within the METS file. | No change |
| /fileGrp | 1..n | This specification requires that one specific occurrence of the fileGrp element is included as described above. Implementers are welcome to define and add additional file groups necessary for internal purposes. The main fileGrp element includes additional nested fileGrp elements, one for each folder of the package (except metadata described in amdSec and dmdSec). | No change |
| /fileGrp/@ID | 0..1 | Recommended, identifier must be unique within the package | No change |
| /fileGrp/ @VERSDATE | 0..1 | Version date of the file grouping | No change |
| /fileGrp/ @ADMID | 0..1 | In case administrative metadata is available and described within METS about the file group, this element must reference the appropriate ID of the administrative metadata section. | No change |
| /fileGrp/ @USE | 1..1 | Recommended in Common Specification with one occurrence bearing the values “Common Specification root” (for the root fileGrp element and the names of appropriate folders for nested fileGrp occurrences. | No change |
| /fileGrp/file | 1..n | The Common Specification requires that fileGrp must contain at least one file element either pointing to content files with FLocat or wrapping the content files using FContent | No change |
| /fileGrp/ file/@ID | 1..1 | Mandatory, must be unique across the package | Add/update |
| /fileGrp/ file/ @MIMETYPE | 1..1 | The IANA mime type for the wrapped or linked file. Required by the Common Specification. | Add/update (reflecting change of format) |
| /fileGrp/ file/ @SEQ | 0..1 | Used to describe the sequence of files listed within the fileGrp element | No change |
| /fileGrp/ file/ @SIZE | 1..1 | Size of the linked or embedded file in bytes. Required by the Common Specification | Add/update |
| /fileGrp/ file/ @CREATED | 1..1 | Date the embedded/linked file was created. Required by the Common Specification | Add/update |
| /fileGrp/ file/ @CHECKSUM | 1..1 | The checksum of the embedded/linked file. Required by the Common Specification | Add/update |
| /fileGrp/ file/ @CHECKSUMTYPE | 1..1 | The type of checksum used for the embedded/linked file. Required by the Common Specification | No change (unless type is actually changed) |
| /fileGrp/ file/ @OWNERID | 0..1 | Unique ID of the file assigned by its owner | No change |
| /fileGrp/ file/ @ADMID | 0..1 | In case administrative metadata is available and described within METS about the file, this element must reference the appropriate ID of the administrative metadata section. | No change (e.g. link to EAD) |
| /fileGrp/ file/ @DMDID | 0..1 | Value for the ID attribute of the dmdSec containing metadata describing the content files listed in the file element. | Add/Update (e.g. link to PREMIS) |
| /fileGrp/ file/ @GROUPID | 0..1 | Provides an ID for a fileGrp containing related files. | No change |
| /fileGrp/ file/ @USE | 0..1 | Statement about intended use of the files | No change |
| /fileGrp/ file/ FLocat | | The location of each external file must be defined by the <FLocat> element using the same rules as for referencing metadata files. All references to files should be made using the XLink href attribute and the file protocol using the relative location of the file. Example: xlink:href="file:schemas/mets.xsd" | Add/Update |
| /fileGrp/ file/ FLocat/ @ID | 0..1 | An ID for the <FLocat> element | Add/Update |
| /fileGrp/ file/ FLocat/ @LOCTYPE | 1..1 | Mandatory locator pointing to the external file. | Add/Update |
| /fileGrp/ file/ FLocat/ @OTHERLOCTYPE | 0..1 | Description of the type of locator used | No change |
| /fileGrp/ file/ FContent/ @ID | 0..1 | An ID for the <FContent> element | No change - not recommended |
| /fileGrp/ file/ FContent/ @USE | 0..1 | Statement about intended use of the embedded file | No change - not recommended |

**Table 10 - Differences between the AIP METS and the DIP METS on node level: structmap**
**Node level: structmap**

|Element/ Attribute|Cardi&shy;nality|Description and usage|Change for DIP|
|-----------------|------------|---------------------|--------------|
| structMap | 1..n | Each METS file needs to include exactly one structMap element used exactly as described in this table. Institutions can add their own additional custom structural maps as separate structMap sections. | No change |
| @ID | 0..1 | Optional, but if used must be unique within the package | No change |
| @TYPE | 1..1 | Mandatory in this specification. The value must be “physical” | No change |
| @LABEL | 1..1 | Mandatory in this specification. The value must be “Common Specification structural map” | No change |
| /div | 0..n | Each folder (and sub-folder) within the package must be represented by an occurrence of the <div> element. Please note that sub-folders must be represented as nested div elements. Example: '<structMap TYPE="physical" LABEL="Common Specification structural map"> <div LABEL="Package123"> <div LABEL="metadata">' | No change |
| /div/@ID | 1..1 | Mandatory, identifier must be unique within the package | No change |
| /div/@TYPE | 0..1 | No specific requirements | No change |
| /div/@LABEL | 1..1 | Mandatory, value must be the name of the folder (“metadata”, “descriptive”, “schemas”, “representations”, etc). The LABEL value of the first div element in the package is the ID of the package | No change |
| /div/@DMDID | 0..1 | ID attribute values identifying the dmdSec, elements in the METS document that contain or link to descriptive metadata pertaining to the structural division represented by the current div element | Add/Update |
| /div/@ADMID | 0..1 | No specific requirements | Add/Update |
| /div/@ORDER | 0 | Not used in the specific Common Specification structMap occurrence | No change |
| /div/ @ORDERLABEL | 0 | Not used in the specific Common Specification structMap occurrence | No change |
| /div/ @CONTENTIDS | 0..1 | IDs for the content in this division. No specific use requirements. | No change |
| /div/fptr | 0..n | If the folder which is described by the div element includes computer files these must be referenced by using the fptr element. The only exception is the description of representations (see below for the use of mptr). The fptr child elements par, seq and area must not be used. | Add/Update |
| /div/fptr/@ID | 0..1 | No specific requirements | No change |
| /div/ fptr/ @FILEID | 1..1 | Mandatory, must be the ID used in the appropriate file or mdRef element | Add/Update |
| /div/ fptr/ @CONTENTIDS | 0..1 | IDs for the content referenced by this fptr element. No specific requirements | No change |
| /div/div/mptr | 0..n | In the case of describing representations within the package (i.e. representations/representation1) the content of the representations must not be described. Instead the <div> of the specific representation should include one and only one occurrence of the <mptr> element, pointing to the appropriate representation METS file. The references to representation METS files must be made using the XLink href attribute and the file protocol using the relative location of the file. Example: xlink:href="file:representation/ representation1/mets.xml" The XLink type attribute is used with the fixed value “simple”. Example: xlink:type="simple" The LOCTYPE attribute is used with the fixed value ”URL” | No change |
| /div/ div/ mptr/@ID | 0..1 | Unique ID for this element | No change |
| /div/ div/ mptr/ @LOCTYPE | 0..1 | The locator type used in the xlink:href attribute | No change |
| /div/ div/ mptr/ @OTHERLOCTYPE | 0..1 | Locator type in xlink:href when LOCTYPE=”OTHER” | No change |
| /div/ div/ mptr/ @CONTENTIDS | 0..1 | The content ID for the content represented by the mptr element. | No change |