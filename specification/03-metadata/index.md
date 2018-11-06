### ​3.1.2​ Metadata in the DIP

The DIP metadata is based upon the existing common, SIP and AIP
specifications. The metadata descriptions provided in this document
cover the three core metadata categories: structural[^56] (METS[^57]);
preservation[^58] (PREMIS[^59]); and descriptive[^60] (EAD[^61])).

[^56]: Structural metadata describes the physical and/or logical
    structure of digital resources. The standard that E-ARK recommends
    for structural metadata is METS.

[^57]: Metadata Encoding and Transmission Standard. The METS schema is a
    standard for encoding descriptive, administrative, and structural
    metadata regarding objects within a digital library, expressed using
    the XML schema language of the World Wide Web Consortium. The
    standard is maintained in the Network Development and MARC Standards
    Office of the Library of Congress, and is being developed as an
    initiative of the Digital Library Federation -
    <http://www.loc.gov/standards/mets/>

[^58]: Preservation metadata is an essential component of most digital
    preservation strategies. Preservation metadata is information that
    supports and documents the digital preservation process -
    https://en.wikipedia.org/wiki/Preservation\_metadata

    The standard that E-ARK recommends for preservation metadata is
    PREMIS.

[^59]: The Preservation Metadata: Implementation Strategies. The PREMIS
    Data Dictionary for Preservation Metadata is the international
    standard for metadata to support the preservation of Digital Objects
    and ensure their long-term usability -
    http://www.loc.gov/standards/premis/

[^60]: Also named Descriptive Information in OAIS: The set of
    information, consisting primarily of Package Descriptions, which is
    provided to Data Management to support the finding, ordering, and
    retrieving of OAIS information holdings by Consumers -
    <http://public.ccsds.org/publications/archive/650x0m2.pdf>.

    The standard that E-ARK recommends for descriptive metadata is EAD.

[^61]: Encoded Archival Description. A non-proprietary de facto standard
    for the encoding of Finding Aids for use in a networked (online)
    environment. EAD allows the standardization of collection
    information in Finding Aids within and across repositories. EAD3
    About
    [[http://www.loc.gov/ead/eadabout.html]{.underline}](http://www.loc.gov/ead/eadabout.html).

The DIP is based on the AIP, and structural and preservation metadata
are thus always - slightly modified - present in the DIP. The METS file
is in the root folder, and its schema file (mets.xsd) is in the /schemas
folder. The greater part of the Access Software assumes the existence of
an EAD and a PREMIS file in the root /metadata/descriptive folder and in
the root /metadata/preservation/ folder respectively. Consequently it is
also assumed that pertaining schema files (ead3.xsd; premis.xsd) are
present in the /schemas folder.

#### ​3.1.2.1​ METS

METS (Metadata Encoding and Transmission Standard) is a standard for
encoding descriptive, administrative, and structural metadata expressed
using the XML Schema Language.

The XML Schema for METS for an E-ARK DIP is the same XML schema as for
an E-ARK AIP (i.e. the same mets.xsd file[^62]).

[^62]: Over time the METS versions will change and therefore they may be
    a difference in version between the AIP and the DIP, but we assume
    that the AIP will be migrated and therefore that the difference will
    not occur or at least be small.

The XML instance for METS for an E-ARK DIP is based on the same instance
as an E-ARK AIP (i.e. different mets.xml files).

The differences between a METS instance for an E-ARK DIP vs an E-ARK AIP
are small. Actually, most of the metadata differences between an AIP and
a DIP are in the PREMIS and the EAD metadata.

The DIP specification is limited to include one and only one
representation from an AIP (for which many may exist). The chosen
representation is itself an E-ARK IP and therefore follows the same
structure. This is reflected in the IP being migrated from an AIP to a
DIP. Below is a broad overview of the METS file.

             **Elements**                                **Values**                    **Comments**
  ---------- --------------- ------------- ------------- ----------------------------- -----------------------------------------
  **mets**                                                                             
             **metsHdr**                                                               
                             **agent**                                                 software or archivist creating the DIP
             **dmdSec**                                                                
                             **mdRef**                   *EAD*                         information about the EAD file
             **amdSec**                                                                
                             **mdRef**                   *PREMIS*                      information about the PREMIS file
             **fileSec**                                                               
                             **fileGrp**                 *Common Specification root*   
                                           **fileGrp**   *metadata*                    
                                           **fileGrp**   *representations*             normally only one repr. in the DIP
                                           **fileGrp**   *schemas*                     
                                           **fileGrp**   *documentation*               
             **structMap**                                                             
                             **div **                    *metadata*                    
                             **div**                     *representations*             mets pointer to mets file for the repr.
                             **div**                     *schemas*                     
                             **div**                     *documentation*               

**Table 3 - Broad overview of the METS file**

In the following the major differences between an XML instance for METS
for an E-ARK DIP vs an E-ARK AIP are listed.

**Node level: mets**

+-----------------+-----------------+-----------------+-----------------+
| **Element/      | **Cardinality** | **Description   | **Change for    |
| Attribute**     |                 | and usage in    | DIP**           |
|                 |                 | Common          |                 |
|                 |                 | specification** |                 |
+=================+=================+=================+=================+
| mets            | 1..1            | The root level  | No change       |
|                 |                 | element that is |                 |
|                 |                 | required in all |                 |
|                 |                 | METS documents  |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@ID            | 0..1            | Optional, no    | No change       |
|                 |                 | further         |                 |
|                 |                 | requirements    |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@OBJID         | 1..1            | Mandatory in    | Change - the    |
|                 |                 | this            | value of the    |
|                 |                 | specification.  | attribute OBJID |
|                 |                 | It is           | is changed to a |
|                 |                 | recommended     | new value       |
|                 |                 | that it be the  | reflecting the  |
|                 |                 | same as the     | change in the   |
|                 |                 | name or ID of   | IP from an AIP  |
|                 |                 | the package     | to a DIP.       |
|                 |                 | (the name of    |                 |
|                 |                 | the root        |                 |
|                 |                 | folder). The    |                 |
|                 |                 | OBJID must meet |                 |
|                 |                 | the Common      |                 |
|                 |                 | Specification   |                 |
|                 |                 | requirement of  |                 |
|                 |                 | being unique at |                 |
|                 |                 | least across    |                 |
|                 |                 | the repository  |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@LABEL         | 0..1            | Optional, if    | Change -        |
|                 |                 | used should be  | Recommended to  |
|                 |                 | filled with a   | be "METS file   |
|                 |                 | human-readable  | describing the  |
|                 |                 | description of  | DIP matching    |
|                 |                 | the package     | the OBJID"      |
+-----------------+-----------------+-----------------+-----------------+
| \@TYPE          | 1..1            | Mandatory in    | No change       |
|                 |                 | this            |                 |
|                 |                 | specification.  |                 |
|                 |                 | The TYPE        |                 |
|                 |                 | attribute must  |                 |
|                 |                 | be used for     |                 |
|                 |                 | identifying the |                 |
|                 |                 | type of the     |                 |
|                 |                 | package         |                 |
|                 |                 | (genre), for    |                 |
|                 |                 | example ERMS,   |                 |
|                 |                 | RDBMS,          |                 |
|                 |                 | digitised       |                 |
|                 |                 | construction    |                 |
|                 |                 | plans.          |                 |
|                 |                 |                 |                 |
|                 |                 | However, there  |                 |
|                 |                 | is no fixed     |                 |
|                 |                 | vocabulary and  |                 |
|                 |                 | as such         |                 |
|                 |                 | implementers    |                 |
|                 |                 | are welcome to  |                 |
|                 |                 | use values most |                 |
|                 |                 | suitable for    |                 |
|                 |                 | their needs.    |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@CONTENTTYPESP | 0..1            | An attribute    | Change to one   |
| ECIFICATION     |                 | added by this   | of these:       |
|                 |                 | specification.  |                 |
|                 |                 | It describes    | SMURFERMS       |
|                 |                 | which content   |                 |
|                 |                 | information     | SMURFSFSB       |
|                 |                 | type            |                 |
|                 |                 | specification   | SIARD1 SIARD2   |
|                 |                 | is used for the | SIARDDK         |
|                 |                 | content. Values |                 |
|                 |                 | of the          | OLAPCube        |
|                 |                 | attribute are   |                 |
|                 |                 | fixed in the    | GeoVectorGML    |
|                 |                 | following       | GeoRasterGeotif |
|                 |                 | vocabulary:     | f               |
|                 |                 |                 |                 |
|                 |                 | SMURFERMS \*    |                 |
|                 |                 | SMURFSFSB \*    |                 |
|                 |                 | SIARD1 \*       |                 |
|                 |                 | SIARD2 SIARDDK  |                 |
|                 |                 | \* GeoVectorGML |                 |
|                 |                 | \*              |                 |
|                 |                 | GeoRasterGeotif |                 |
|                 |                 | f               |                 |
|                 |                 |                 |                 |
|                 |                 | NB The          |                 |
|                 |                 | vocabulary is   |                 |
|                 |                 | extensible as   |                 |
|                 |                 | additional      |                 |
|                 |                 | content         |                 |
|                 |                 | information     |                 |
|                 |                 | type            |                 |
|                 |                 | specifications  |                 |
|                 |                 | are developed.  |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@PROFILE       | 1..1            | Mandatory in    | No change       |
|                 |                 | this            |                 |
|                 |                 | specification.  |                 |
|                 |                 | The PROFILE     |                 |
|                 |                 | attribute has   |                 |
|                 |                 | to have as its  |                 |
|                 |                 | value the URL   |                 |
|                 |                 | of the official |                 |
|                 |                 | Common          |                 |
|                 |                 | Specification   |                 |
|                 |                 | METS Profile.   |                 |
+-----------------+-----------------+-----------------+-----------------+

 **Table 4 - Differences between the AIP METS and the DIP METS on node
level: mets**

**Node level: metsHdr**

+-----------------+-----------------+-----------------+-----------------+
| **Element/      | **Cardinality** | **Description   | **Change for    |
| Attribute **    |                 | and usage**     | DIP**           |
+=================+=================+=================+=================+
| metsHdr         | 0..1            | Element for     |                 |
|                 |                 | describing the  |                 |
|                 |                 | package itself  |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@ID            | 0..1            | Optional, no    | No change       |
|                 |                 | further         |                 |
|                 |                 | requirements    |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@ADMID         | 0..1            | Optional,       | No change       |
|                 |                 | referring to    |                 |
|                 |                 | the appropriate |                 |
|                 |                 | administrative  |                 |
|                 |                 | metadata        |                 |
|                 |                 | section, if     |                 |
|                 |                 | used for        |                 |
|                 |                 | metadata about  |                 |
|                 |                 | the package as  |                 |
|                 |                 | a whole.        |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@CREATEDATE    | 1..1            | Mandatory, the  | Change to       |
|                 |                 | date of         | creation date   |
|                 |                 | creation of the | for DIP         |
|                 |                 | package         |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@LASTMODDATE   | 0..n            | Mandatory if    | Change to date  |
|                 |                 | relevant (in    | of              |
|                 |                 | case the        | modification,   |
|                 |                 | package has     | if DIP has been |
|                 |                 | been modified)  | created in      |
|                 |                 |                 | several steps.  |
+-----------------+-----------------+-----------------+-----------------+
| \@RECORDSTATUS  | 0..1            | Optional, no    | No change       |
|                 |                 | further         |                 |
|                 |                 | requirements    |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@PACKAGETYPE   | 1..1            | An attribute    | Change to DIP   |
|                 |                 | added by the    |                 |
|                 |                 | Common          |                 |
|                 |                 | Specification   |                 |
|                 |                 | for describing  |                 |
|                 |                 | the type of the |                 |
|                 |                 | IP. The         |                 |
|                 |                 | vocabulary to   |                 |
|                 |                 | be used         |                 |
|                 |                 | contains        |                 |
|                 |                 | values:SIP,     |                 |
|                 |                 | AIP, DIP, AIU,  |                 |
|                 |                 | AIC             |                 |
|                 |                 |                 |                 |
|                 |                 | The vocabulary  |                 |
|                 |                 | is managed by   |                 |
|                 |                 | the DAS Board   |                 |
|                 |                 | and will be     |                 |
|                 |                 | updated when    |                 |
|                 |                 | required.       |                 |
+-----------------+-----------------+-----------------+-----------------+
| agent           | 1..n            | The *metsHdr*   |                 |
|                 |                 | must include at |                 |
|                 |                 | least one agent |                 |
|                 |                 | describing the  |                 |
|                 |                 | software which  |                 |
|                 |                 | has been used   |                 |
|                 |                 | to create the   |                 |
|                 |                 | package         |                 |
|                 |                 | (TYPE="OTHER"   |                 |
|                 |                 | ROLE="CREATOR"  |                 |
|                 |                 | OTHERTYPE="SOFT |                 |
|                 |                 | WARE").         |                 |
|                 |                 |                 |                 |
|                 |                 | Description of  |                 |
|                 |                 | all other       |                 |
|                 |                 | agents is       |                 |
|                 |                 | optional.       |                 |
+-----------------+-----------------+-----------------+-----------------+
| agent/ \@ID     | 0..1            | An ID for the   | No change       |
|                 |                 | agent.          |                 |
+-----------------+-----------------+-----------------+-----------------+
| agent/ \@ROLE   | 1..1            | The role of the | No change       |
|                 |                 | agent. The      |                 |
|                 |                 | Common          |                 |
|                 |                 | Specification   |                 |
|                 |                 | requires        |                 |
|                 |                 | describing at   |                 |
|                 |                 | least one agent |                 |
|                 |                 | with the        |                 |
|                 |                 | *agent/\@ROLE*  |                 |
|                 |                 | value           |                 |
|                 |                 | "CREATOR".      |                 |
|                 |                 |                 |                 |
|                 |                 | For other       |                 |
|                 |                 | (optional)      |                 |
|                 |                 | occurrences of  |                 |
|                 |                 | *agent* this    |                 |
|                 |                 | attribute shall |                 |
|                 |                 | use a value     |                 |
|                 |                 | from the fixed  |                 |
|                 |                 | list provided   |                 |
|                 |                 | by METS.        |                 |
+-----------------+-----------------+-----------------+-----------------+
| agent/          | 0..1            | A textual       | No change       |
| \@OTHERROLE     |                 | description of  |                 |
|                 |                 | the role of the |                 |
|                 |                 | agent in case   |                 |
|                 |                 | the value of    |                 |
|                 |                 | *agent/\@ROLE*  |                 |
|                 |                 | is "OTHER".     |                 |
+-----------------+-----------------+-----------------+-----------------+
| agent/ \@TYPE   | 0..1            | The Common      | No change       |
|                 |                 | Specification   |                 |
|                 |                 | requires that   |                 |
|                 |                 | at least one    |                 |
|                 |                 | instance of the |                 |
|                 |                 | *agent* element |                 |
|                 |                 | includes the    |                 |
|                 |                 | *agent/\@TYPE*  |                 |
|                 |                 | attribute with  |                 |
|                 |                 | the value       |                 |
|                 |                 | "OTHER".        |                 |
|                 |                 |                 |                 |
|                 |                 | In other        |                 |
|                 |                 | occurrences of  |                 |
|                 |                 | the *agent*     |                 |
|                 |                 | element the     |                 |
|                 |                 | attribute is    |                 |
|                 |                 | optional. If    |                 |
|                 |                 | used, values    |                 |
|                 |                 | defined in      |                 |
|                 |                 | official METS   |                 |
|                 |                 | documentation   |                 |
|                 |                 | shall be        |                 |
|                 |                 | followed        |                 |
|                 |                 | ("individual",  |                 |
|                 |                 | "organisation", |                 |
|                 |                 | "other\").      |                 |
+-----------------+-----------------+-----------------+-----------------+
| agent/          | 0..1            | The Common      | No change       |
| \@OTHERTYPE     |                 | Specification   |                 |
|                 |                 | requires that   |                 |
|                 |                 | at least one    |                 |
|                 |                 | instance of the |                 |
|                 |                 | *agent* element |                 |
|                 |                 | includes the    |                 |
|                 |                 | *agent/\@OTHERT |                 |
|                 |                 | YPE*            |                 |
|                 |                 | attribute with  |                 |
|                 |                 | the value       |                 |
|                 |                 | "SOFTWARE".     |                 |
|                 |                 |                 |                 |
|                 |                 | In other        |                 |
|                 |                 | occurrences     |                 |
|                 |                 | this attribute  |                 |
|                 |                 | shall only be   |                 |
|                 |                 | used in case    |                 |
|                 |                 | the value of    |                 |
|                 |                 | agent/\@TYPE is |                 |
|                 |                 | "OTHER".        |                 |
+-----------------+-----------------+-----------------+-----------------+
| agent/ name     | 1..1            | The name of the | Change to name  |
|                 |                 | agent. In the   | of the agent    |
|                 |                 | Common          | that created    |
|                 |                 | Specification   | the DIP from    |
|                 |                 | occurrence of   | the AIP         |
|                 |                 | the *agent*     |                 |
|                 |                 | element this    |                 |
|                 |                 | element must    |                 |
|                 |                 | provide the     |                 |
|                 |                 | name of the     |                 |
|                 |                 | software tool   |                 |
|                 |                 | which was used  |                 |
|                 |                 | to create the   |                 |
|                 |                 | IP.             |                 |
+-----------------+-----------------+-----------------+-----------------+
| agent/ note     | 0..1            | Additional      | Change to       |
|                 |                 | information     | version no. for |
|                 |                 | about the       | the DIP         |
|                 |                 | agent. We       | creation        |
|                 |                 | recommend using | software.       |
|                 |                 | this element to |                 |
|                 |                 | provide version |                 |
|                 |                 | information for |                 |
|                 |                 | the tool which  |                 |
|                 |                 | was used to     |                 |
|                 |                 | create the IP.  |                 |
+-----------------+-----------------+-----------------+-----------------+
| altRecordID     | 0..n            | A container for | No change       |
|                 |                 | an alternative  |                 |
|                 |                 | ID for the      |                 |
|                 |                 | package         |                 |
|                 |                 | content.        |                 |
+-----------------+-----------------+-----------------+-----------------+
| altRecordID/    | 0..1            | An ID for the   | No change       |
| \@ID            |                 | *altRecordID*   |                 |
|                 |                 | element within  |                 |
|                 |                 | the METS        |                 |
|                 |                 | document.       |                 |
+-----------------+-----------------+-----------------+-----------------+
| altRecordID/    | 0..1            | Used to         | No change       |
| \@TYPE          |                 | describe the    |                 |
|                 |                 | type of ID      |                 |
|                 |                 | assigned. It is |                 |
|                 |                 | recommended to  |                 |
|                 |                 | use the Library |                 |
|                 |                 | of Congress     |                 |
|                 |                 | vocabulary for  |                 |
|                 |                 | this element    |                 |
|                 |                 | when used.      |                 |
+-----------------+-----------------+-----------------+-----------------+
| metsDocumentID  | 0..1            | A unique        | No change       |
|                 |                 | identifier for  |                 |
|                 |                 | the METS        |                 |
|                 |                 | document        |                 |
|                 |                 | itself.         |                 |
+-----------------+-----------------+-----------------+-----------------+
| metsDocumentID/ | 0..1            | The ID of the   | No change       |
| \@ID            |                 | *metsDocumentID |                 |
|                 |                 | *               |                 |
|                 |                 | element.        |                 |
+-----------------+-----------------+-----------------+-----------------+
| metsDocumentID/ | 0..1            | The type of the | No change       |
| \@TYPE          |                 | identifier      |                 |
|                 |                 | assigned to the |                 |
|                 |                 | element.        |                 |
+-----------------+-----------------+-----------------+-----------------+

**Table 5 - Differences between the AIP METS and the DIP METS on node
level: metsHDR**

**Node level: dmdSec**

+-----------------+-----------------+-----------------+-----------------+
| **Element/      | **Cardinality** | **Description   | **Change for    |
| Attribute **    |                 | and usage**     | DIP**           |
+=================+=================+=================+=================+
| dmdSec          | 0..n            | Must be used if | No change.      |
|                 |                 | descriptive     |                 |
|                 |                 | metadata about  | The DIP spec.   |
|                 |                 | the package     | assumes the EAD |
|                 |                 | content is      | is in the AIP.  |
|                 |                 | available.      |                 |
|                 |                 |                 | The EAD is      |
|                 |                 | NOTE: According | needed to find  |
|                 |                 | to official     | the AIP with    |
|                 |                 | METS            | the desired     |
|                 |                 | documentation   | content.        |
|                 |                 | each metadata   |                 |
|                 |                 | section must    |                 |
|                 |                 | describe one    |                 |
|                 |                 | and only one    |                 |
|                 |                 | set of          |                 |
|                 |                 | metadata. As    |                 |
|                 |                 | such, if        |                 |
|                 |                 | implementers    |                 |
|                 |                 | want to include |                 |
|                 |                 | multiple        |                 |
|                 |                 | occurrences of  |                 |
|                 |                 | descriptive     |                 |
|                 |                 | metadata into   |                 |
|                 |                 | the package     |                 |
|                 |                 | this must be    |                 |
|                 |                 | done by         |                 |
|                 |                 | repeating the   |                 |
|                 |                 | whole *dmdSec*  |                 |
|                 |                 | element for     |                 |
|                 |                 | each individual |                 |
|                 |                 | metadata.       |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@ID            | 1..1            | Mandatory,      | No change       |
|                 |                 | identifier must |                 |
|                 |                 | be unique       |                 |
|                 |                 | within the      |                 |
|                 |                 | package         |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@GROUPID       | 0..1            | Can be used to  | No change       |
|                 |                 | group together  |                 |
|                 |                 | different       |                 |
|                 |                 | metadata        |                 |
|                 |                 | sections.       |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@ADMID         | 0..1            | In case         | No change       |
|                 |                 | administrative  |                 |
|                 |                 | (provenance)    |                 |
|                 |                 | metadata is     |                 |
|                 |                 | available and   |                 |
|                 |                 | described       |                 |
|                 |                 | within METS     |                 |
|                 |                 | about changes   |                 |
|                 |                 | to the          |                 |
|                 |                 | descriptive     |                 |
|                 |                 | metadata, this  |                 |
|                 |                 | element must    |                 |
|                 |                 | reference the   |                 |
|                 |                 | appropriate ID  |                 |
|                 |                 | of the          |                 |
|                 |                 | administrative  |                 |
|                 |                 | metadata        |                 |
|                 |                 | section.        |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@CREATED       | 1..1            | Required by the | No change       |
|                 |                 | Common          |                 |
|                 |                 | Specification.  |                 |
|                 |                 | Creation date   |                 |
|                 |                 | of the metadata |                 |
|                 |                 | in this         |                 |
|                 |                 | section, needed |                 |
|                 |                 | to track        |                 |
|                 |                 | changes to      |                 |
|                 |                 | metadata files. |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@STATUS        | 0..1            | Status of the   | No change       |
|                 |                 | metadata.       |                 |
|                 |                 | Recommended for |                 |
|                 |                 | use to indicate |                 |
|                 |                 | currency of     |                 |
|                 |                 | package. If     |                 |
|                 |                 | used it is      |                 |
|                 |                 | recommended to  |                 |
|                 |                 | use one of the  |                 |
|                 |                 | two values      |                 |
|                 |                 | "SUPERSEDED" or |                 |
|                 |                 | "CURRENT".      |                 |
+-----------------+-----------------+-----------------+-----------------+
| /mdRef          | 0..1            | Reference to    |                 |
|                 |                 | the descriptive |                 |
|                 |                 | metadata file   |                 |
|                 |                 | stored in the   |                 |
|                 |                 | "**metadata**"  |                 |
|                 |                 | folder of the   |                 |
|                 |                 | IP.             |                 |
|                 |                 |                 |                 |
|                 |                 | In each         |                 |
|                 |                 | occurrence of   |                 |
|                 |                 | the *dmdSec*    |                 |
|                 |                 | exactly one of  |                 |
|                 |                 | the elements    |                 |
|                 |                 | mdRef or mdWrap |                 |
|                 |                 | must be         |                 |
|                 |                 | present. The    |                 |
|                 |                 | Common          |                 |
|                 |                 | Specification   |                 |
|                 |                 | recommends the  |                 |
|                 |                 | use of *mdRef*  |                 |
|                 |                 | over *mdWrap*   |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@ID            | 0..1            | Unique ID for   | No change       |
|                 |                 | the *mdRef*     |                 |
|                 |                 | section within  |                 |
|                 |                 | the METS        |                 |
|                 |                 | document.       |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@MIMETYPE      | 0..1            | The IANA media  | No change       |
|                 |                 | type for the    |                 |
|                 |                 | external file.  |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@LABEL         | 0..1            | A name for the  | No change       |
|                 |                 | referenced      |                 |
|                 |                 | file.           |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@XPTR          | 0..1            | Locates the     | No change       |
|                 |                 | point within a  |                 |
|                 |                 | file to which   |                 |
|                 |                 | the *mdRef*     |                 |
|                 |                 | element refers, |                 |
|                 |                 | if applicable,  |                 |
|                 |                 | using any valid |                 |
|                 |                 | XPointer        |                 |
|                 |                 | scheme.         |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@LOCTYPE       | 1..1            | Specifies the   | No change       |
|                 |                 | locator type    |                 |
|                 |                 | used in the     |                 |
|                 |                 | xlink:href      |                 |
|                 |                 | which points to |                 |
|                 |                 | the file.       |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@OTHERLOCTYPE  | 0..1            | Required when   | No change       |
|                 |                 | *mdRef/\@LOCTYP |                 |
|                 |                 | E*              |                 |
|                 |                 | ="OTHER".       |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@MDTYPE        | 1..1            | Specifies the   | No change       |
|                 |                 | type of         |                 |
|                 |                 | metadata in the |                 |
|                 |                 | linked file.    |                 |
|                 |                 | Values should   |                 |
|                 |                 | be taken from   |                 |
|                 |                 | the METS list   |                 |
|                 |                 | provided.       |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@MDTYPEVERSION | 0..1            | The version of  | No change       |
|                 |                 | the metadata    |                 |
|                 |                 | type described  |                 |
|                 |                 | in MDTYPE       |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@OTHERMDTYPE   | 0..1            | The type of     | No change       |
|                 |                 | metadata when   |                 |
|                 |                 | MDTYPE="OTHER"  |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@SIZE          | 0..1            | Size of linked  | No change       |
|                 |                 | file in bytes   |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@CREATED       | 0..1            | Date the linked | No change       |
|                 |                 | file was        |                 |
|                 |                 | created         |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@CHECKSUM      | 0..1            | The checksum of | No change       |
|                 |                 | the linked file |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@CHECKSUMTYPE  | 0..1            | The type of     | No change       |
|                 |                 | checksum used   |                 |
|                 |                 | for calculating |                 |
|                 |                 | the checksum of |                 |
|                 |                 | the linked file |                 |
+-----------------+-----------------+-----------------+-----------------+
| /mdWrap         | 0..1            | Wrapper for     | No change       |
|                 |                 | descriptive     |                 |
|                 |                 | metadata        |                 |
|                 |                 | embedded into   |                 |
|                 |                 | the METS        |                 |
|                 |                 | document.       |                 |
|                 |                 |                 |                 |
|                 |                 | In each         |                 |
|                 |                 | occurrence of   |                 |
|                 |                 | the *dmdSec*    |                 |
|                 |                 | exactly one of  |                 |
|                 |                 | the elements    |                 |
|                 |                 | mdRef or mdWrap |                 |
|                 |                 | must be         |                 |
|                 |                 | present. The    |                 |
|                 |                 | Common          |                 |
|                 |                 | Specification   |                 |
|                 |                 | recommends the  |                 |
|                 |                 | use of *mdRef*  |                 |
|                 |                 | over *mdWrap*   |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@ID            | 0..1            | Unique ID for   | No change       |
|                 |                 | the mdWrap      |                 |
|                 |                 | section within  |                 |
|                 |                 | the METS        |                 |
|                 |                 | document.       |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@MIMETYPE      | 0..1            | The IANA mime   | No change       |
|                 |                 | type for the    |                 |
|                 |                 | wrapped         |                 |
|                 |                 | metadata.       |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@LABEL         | 0..1            | A name for the  | No change       |
|                 |                 | associated      |                 |
|                 |                 | metadata.       |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@MDTYPE        | 1..1            | Specifies the   | No change       |
|                 |                 | type of         |                 |
|                 |                 | embedded        |                 |
|                 |                 | metadata.       |                 |
|                 |                 | Values should   |                 |
|                 |                 | be taken from   |                 |
|                 |                 | the METS list   |                 |
|                 |                 | provided.       |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@MDTYPEVERSION | 0..1            | The version of  | No change       |
|                 |                 | the metadata    |                 |
|                 |                 | type described  |                 |
|                 |                 | in MDTYPE       |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@OTHERMDTYPE   | 0..1            | The type of     | No change       |
|                 |                 | metadata when   |                 |
|                 |                 | MDTYPE="OTHER"  |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@SIZE          | 0..1            | Size of         | No change       |
|                 |                 | associated      |                 |
|                 |                 | metadata in     |                 |
|                 |                 | bytes           |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@CREATED       | 0..1            | Date the        | No change       |
|                 |                 | embedded        |                 |
|                 |                 | metadata was    |                 |
|                 |                 | created         |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@CHECKSUM      | 0..1            | The checksum of | No change       |
|                 |                 | the wrapped     |                 |
|                 |                 | content         |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@CHECKSUMTYPE  | 0..1            | The type of     | No change       |
|                 |                 | checksum used   |                 |
|                 |                 | for calculating |                 |
|                 |                 | the checksum of |                 |
|                 |                 | the embedded    |                 |
|                 |                 | metadata        |                 |
+-----------------+-----------------+-----------------+-----------------+
| /binData        | 0..1            | A wrapper       | No change       |
|                 |                 | element to      |                 |
|                 |                 | contain Base64  |                 |
|                 |                 | encoded         |                 |
|                 |                 | metadata        |                 |
+-----------------+-----------------+-----------------+-----------------+
| /xmldata        | 0..1            | A wrapper       | No change       |
|                 |                 | element to      |                 |
|                 |                 | contain XML     |                 |
|                 |                 | encoded         |                 |
|                 |                 | metadata        |                 |
+-----------------+-----------------+-----------------+-----------------+

**Table 6 - Differences between the AIP METS and the DIP METS on node
level: dmdsec**

**Node** **level: amdSec**

+-----------------+-----------------+-----------------+-----------------+
| **Element/      | **Cardinality** | **Description   | **Change for    |
| Attribute **    |                 | and usage**     | DIP**           |
+=================+=================+=================+=================+
| amdSec          | 0..n            | In case         | Mandatory for   |
|                 |                 | administrative  | DIP             |
|                 |                 | / preservation  |                 |
|                 |                 | metadata is     |                 |
|                 |                 | available, it   |                 |
|                 |                 | must be         |                 |
|                 |                 | described using |                 |
|                 |                 | the *amdSec*    |                 |
|                 |                 | element.        |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@ID            | 0..1            | Unique ID for   | No change       |
|                 |                 | the *amdSec*    |                 |
|                 |                 | within the METS |                 |
|                 |                 | document        |                 |
+-----------------+-----------------+-----------------+-----------------+
| digiprovMD      | 0..n            | The Common      | The DIP spec.   |
|                 |                 | Specification   | assumes that a  |
|                 |                 | recommends the  | PREMIS file is  |
|                 |                 | use of PREMIS   | updated or      |
|                 |                 | metadata for    | created during  |
|                 |                 | recording       | the AIP to DIP  |
|                 |                 | information     | migration       |
|                 |                 | about           |                 |
|                 |                 | preservation    |                 |
|                 |                 | events. If      |                 |
|                 |                 | used, PREMIS    |                 |
|                 |                 | metadata must   |                 |
|                 |                 | appear in a     |                 |
|                 |                 | *digiprovMD*    |                 |
|                 |                 | element, either |                 |
|                 |                 | embedded or     |                 |
|                 |                 | linked. It is   |                 |
|                 |                 | mandatory to    |                 |
|                 |                 | include one     |                 |
|                 |                 | *digiprovMD*    |                 |
|                 |                 | element for     |                 |
|                 |                 | each external   |                 |
|                 |                 | file in the     |                 |
|                 |                 | "**metadata/pre |                 |
|                 |                 | servation**"    |                 |
|                 |                 | folder, or for  |                 |
|                 |                 | each embedded   |                 |
|                 |                 | set of PREMIS   |                 |
|                 |                 | metadata.       |                 |
+-----------------+-----------------+-----------------+-----------------+
| techMD          | 0..n            | The use of      | No change       |
|                 |                 | *techMD* is not |                 |
|                 |                 | recommended.    |                 |
|                 |                 | Instead,        |                 |
|                 |                 | detailed        |                 |
|                 |                 | technical       |                 |
|                 |                 | metadata should |                 |
|                 |                 | be included     |                 |
|                 |                 | into or         |                 |
|                 |                 | referenced from |                 |
|                 |                 | appropriate     |                 |
|                 |                 | PREMIS files    |                 |
+-----------------+-----------------+-----------------+-----------------+
| rightsMD        | 0..n            | Optional. The   | No change       |
|                 |                 | Common          |                 |
|                 |                 | Specification   |                 |
|                 |                 | recommends      |                 |
|                 |                 | including a     |                 |
|                 |                 | simple rights   |                 |
|                 |                 | statement which |                 |
|                 |                 | describes the   |                 |
|                 |                 | overall access  |                 |
|                 |                 | status of the   |                 |
|                 |                 | package with    |                 |
|                 |                 | the following   |                 |
|                 |                 | values:         |                 |
|                 |                 |                 |                 |
|                 |                 | -   *Open,      |                 |
|                 |                 |     > Closed,   |                 |
|                 |                 |     > Partially |                 |
|                 |                 |     > closed,   |                 |
|                 |                 |     > Not       |                 |
|                 |                 |     > known*.   |                 |
|                 |                 |                 |                 |
|                 |                 | However, the    |                 |
|                 |                 | exact schema    |                 |
|                 |                 | and element is  |                 |
|                 |                 | up to           |                 |
|                 |                 | individual      |                 |
|                 |                 | implementations |                 |
|                 |                 | to decide       |                 |
+-----------------+-----------------+-----------------+-----------------+
| sourceMD        | 0..n            | Optional, no    | No change       |
|                 |                 | further         |                 |
|                 |                 | requirements    |                 |
+-----------------+-----------------+-----------------+-----------------+

**Table 7 - Differences between the AIP METS and the DIP METS on node
level: amdsec**

The following attributes are available for use with each of the four
specific metadata areas listed above (*xxx* below stands for
*amdSec/digiprovMD*, *amdSec/techMD*, *amdSec/rightsMD* and
*amdSec/sourceMD*).

  **Element/ Attribute **   **Cardinality**   **Description and usage**                                                                                                                                                                                                             **Change for DIP**
  ------------------------- ----------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------------------
  xxx/ \@ID                 1..1              Mandatory for each of the four elements *amdSec/digiprovMD*, *amdSec/techMD*, *amdSec/rightsMD* and *amdSec/sourceMD*. Identifier must be unique within the package                                                                   No change
  xxx/ \@GROUPID            0..1              Optional, no further requirements                                                                                                                                                                                                     No change
  xxx/ \@ADMID              0..1              In case administrative (provenance) metadata is available and described within METS about changes to the metadata occurrence described here, this element must reference the appropriate ID of the administrative metadata section.   No change
  xxx/ \@CREATED            0..1              Optional, no further requirements                                                                                                                                                                                                     No change
  xxx/ \@STATUS             0..1              Recommended for describing currency of metadata. If used, must include one of the two values "superseded" or "current"                                                                                                                No change

**Table 8 - Available attributes**

**Node level: filesec**

+-----------------+-----------------+-----------------+-----------------+
| **Element/      | **Cardinality** | **Description   | **Change for    |
| Attribute **    |                 | and usage**     | DIP**           |
+=================+=================+=================+=================+
| fileSec         | 0..1            | Recommended to  | No change       |
|                 |                 | include one     |                 |
|                 |                 | *fileSec*       |                 |
|                 |                 | element in each |                 |
|                 |                 | METS file       |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@ID            | 0..1            | Recommended.    | No change       |
|                 |                 | The identifier  |                 |
|                 |                 | must be unique  |                 |
|                 |                 | within the METS |                 |
|                 |                 | file.           |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp        | 1..n            | This            | No change       |
|                 |                 | specification   |                 |
|                 |                 | requires that   |                 |
|                 |                 | one specific    |                 |
|                 |                 | occurrence of   |                 |
|                 |                 | the *fileGrp*   |                 |
|                 |                 | element is      |                 |
|                 |                 | included as     |                 |
|                 |                 | described       |                 |
|                 |                 | above.          |                 |
|                 |                 |                 |                 |
|                 |                 | Implementers    |                 |
|                 |                 | are welcome to  |                 |
|                 |                 | define and add  |                 |
|                 |                 | additional file |                 |
|                 |                 | groups          |                 |
|                 |                 | necessary for   |                 |
|                 |                 | internal        |                 |
|                 |                 | purposes. The   |                 |
|                 |                 | main *fileGrp*  |                 |
|                 |                 | element         |                 |
|                 |                 | includes        |                 |
|                 |                 | additional      |                 |
|                 |                 | nested          |                 |
|                 |                 | *fileGrp*       |                 |
|                 |                 | elements, one   |                 |
|                 |                 | for each folder |                 |
|                 |                 | of the package  |                 |
|                 |                 | (except         |                 |
|                 |                 | metadata        |                 |
|                 |                 | described in    |                 |
|                 |                 | *amdSec* and    |                 |
|                 |                 | *dmdSec*).      |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/\@ID   | 0..1            | Recommended,    | No change       |
|                 |                 | identifier must |                 |
|                 |                 | be unique       |                 |
|                 |                 | within the      |                 |
|                 |                 | package         |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/       | 0..1            | Version date of | No change       |
| \@VERSDATE      |                 | the file        |                 |
|                 |                 | grouping        |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/       | 0..1            | In case         | No change       |
| \@ADMID         |                 | administrative  |                 |
|                 |                 | metadata is     |                 |
|                 |                 | available and   |                 |
|                 |                 | described       |                 |
|                 |                 | within METS     |                 |
|                 |                 | about the file  |                 |
|                 |                 | group, this     |                 |
|                 |                 | element must    |                 |
|                 |                 | reference the   |                 |
|                 |                 | appropriate ID  |                 |
|                 |                 | of the          |                 |
|                 |                 | administrative  |                 |
|                 |                 | metadata        |                 |
|                 |                 | section.        |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ \@USE | 1..1            | Recommended in  | No change       |
|                 |                 | Common          |                 |
|                 |                 | Specification   |                 |
|                 |                 | with one        |                 |
|                 |                 | occurrence      |                 |
|                 |                 | bearing the     |                 |
|                 |                 | values "Common  |                 |
|                 |                 | Specification   |                 |
|                 |                 | root" (for the  |                 |
|                 |                 | root *fileGrp*  |                 |
|                 |                 | element and the |                 |
|                 |                 | names of        |                 |
|                 |                 | appropriate     |                 |
|                 |                 | folders for     |                 |
|                 |                 | nested          |                 |
|                 |                 | *fileGrp*       |                 |
|                 |                 | occurrences.    |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/file   | 1..n            | The Common      | No change       |
|                 |                 | Specification   |                 |
|                 |                 | requires that   |                 |
|                 |                 | *fileGrp* must  |                 |
|                 |                 | contain at      |                 |
|                 |                 | least one       |                 |
|                 |                 | *file* element  |                 |
|                 |                 | either pointing |                 |
|                 |                 | to content      |                 |
|                 |                 | files with      |                 |
|                 |                 | *FLocat* or     |                 |
|                 |                 | wrapping the    |                 |
|                 |                 | content files   |                 |
|                 |                 | using           |                 |
|                 |                 | *FContent*      |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/       | 1..1            | Mandatory, must | Add/update      |
| file/\@ID       |                 | be unique       |                 |
|                 |                 | across the      |                 |
|                 |                 | package         |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 1..1            | The IANA mime   | Add/update      |
| \@MIMETYPE      |                 | type for the    | (reflecting     |
|                 |                 | wrapped or      | change of       |
|                 |                 | linked file.    | format)         |
|                 |                 | Required by the |                 |
|                 |                 | Common          |                 |
|                 |                 | Specification.  |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 0..1            | Used to         | No change       |
| \@SEQ           |                 | describe the    |                 |
|                 |                 | sequence of     |                 |
|                 |                 | files listed    |                 |
|                 |                 | within the      |                 |
|                 |                 | *fileGrp*       |                 |
|                 |                 | element         |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 1..1            | Size of the     | Add/update      |
| \@SIZE          |                 | linked or       |                 |
|                 |                 | embedded file   |                 |
|                 |                 | in bytes.       |                 |
|                 |                 | Required by the |                 |
|                 |                 | Common          |                 |
|                 |                 | Specification   |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 1..1            | Date the        | Add/update      |
| \@CREATED       |                 | embedded/linked |                 |
|                 |                 | file was        |                 |
|                 |                 | created.        |                 |
|                 |                 | Required by the |                 |
|                 |                 | Common          |                 |
|                 |                 | Specification   |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 1..1            | The checksum of | Add/update      |
| \@CHECKSUM      |                 | the             |                 |
|                 |                 | embedded/linked |                 |
|                 |                 | file. Required  |                 |
|                 |                 | by the Common   |                 |
|                 |                 | Specification   |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 1..1            | The type of     | No change       |
| \@CHECKSUMTYPE  |                 | checksum used   | (unless type is |
|                 |                 | for the         | actually        |
|                 |                 | embedded/linked | changed)        |
|                 |                 | file. Required  |                 |
|                 |                 | by the Common   |                 |
|                 |                 | Specification   |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 0..1            | Unique ID of    | No change       |
| \@OWNERID       |                 | the file        |                 |
|                 |                 | assigned by its |                 |
|                 |                 | owner           |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 0..1            | In case         | No change (e.g. |
| \@ADMID         |                 | administrative  | link to EAD)    |
|                 |                 | metadata is     |                 |
|                 |                 | available and   |                 |
|                 |                 | described       |                 |
|                 |                 | within METS     |                 |
|                 |                 | about the file, |                 |
|                 |                 | this element    |                 |
|                 |                 | must reference  |                 |
|                 |                 | the appropriate |                 |
|                 |                 | ID of the       |                 |
|                 |                 | administrative  |                 |
|                 |                 | metadata        |                 |
|                 |                 | section.        |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 0..1            | Value for the   | Add/Update      |
| \@DMDID         |                 | ID attribute of | (e.g. link to   |
|                 |                 | the *dmdSec*    | PREMIS)         |
|                 |                 | containing      |                 |
|                 |                 | metadata        |                 |
|                 |                 | describing the  |                 |
|                 |                 | content files   |                 |
|                 |                 | listed in the   |                 |
|                 |                 | file element.   |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 0..1            | Provides an ID  | No change       |
| \@GROUPID       |                 | for a *fileGrp* |                 |
|                 |                 | containing      |                 |
|                 |                 | related files.  |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 0..1            | Statement about | No change       |
| \@USE           |                 | intended use of |                 |
|                 |                 | the files       |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ |                 | The location of | Add/Update      |
| FLocat          |                 | each external   |                 |
|                 |                 | file must be    |                 |
|                 |                 | defined by the  |                 |
|                 |                 | \<FLocat\>      |                 |
|                 |                 | element using   |                 |
|                 |                 | the same rules  |                 |
|                 |                 | as for          |                 |
|                 |                 | referencing     |                 |
|                 |                 | metadata files. |                 |
|                 |                 |                 |                 |
|                 |                 | All references  |                 |
|                 |                 | to files should |                 |
|                 |                 | be made using   |                 |
|                 |                 | the XLink href  |                 |
|                 |                 | attribute and   |                 |
|                 |                 | the file        |                 |
|                 |                 | protocol using  |                 |
|                 |                 | the relative    |                 |
|                 |                 | location of the |                 |
|                 |                 | file.           |                 |
|                 |                 |                 |                 |
|                 |                 | Example:        |                 |
|                 |                 | xlink:href=\"fi |                 |
|                 |                 | le:schemas/mets |                 |
|                 |                 | .xsd\"          |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 0..1            | An ID for the   | Add/Update      |
| FLocat/ \@ID    |                 | \<FLocat\>      |                 |
|                 |                 | element         |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 1..1            | Mandatory       | Add/Update      |
| FLocat/         |                 | locator         |                 |
| \@LOCTYPE       |                 | pointing to the |                 |
|                 |                 | external file.  |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 0..1            | Description of  | No change       |
| FLocat/\@OTHERL |                 | the type of     |                 |
| OCTYPE          |                 | locator used    |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 0..1            | Statement about | No change       |
| FLocat/ \@USE   |                 | intended use of |                 |
|                 |                 | the linked file |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 0..1            | Used for        | No change - not |
| FContent        |                 | identifying     | recommended     |
|                 |                 | content files   |                 |
|                 |                 | wrapped within  |                 |
|                 |                 | the METS file.  |                 |
|                 |                 | The content     |                 |
|                 |                 | file must be    |                 |
|                 |                 | either encoded  |                 |
|                 |                 | in base64 and   |                 |
|                 |                 | inside an       |                 |
|                 |                 | \<binData\>     |                 |
|                 |                 | wrapper, or     |                 |
|                 |                 | encoded in XML  |                 |
|                 |                 | and included    |                 |
|                 |                 | within an       |                 |
|                 |                 | \<xmlData\>     |                 |
|                 |                 | wrapper.        |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 0..1            | An ID for the   | No change - not |
| FContent/ \@ID  |                 | \<FContent\>    | recommended     |
|                 |                 | element         |                 |
+-----------------+-----------------+-----------------+-----------------+
| /fileGrp/ file/ | 0..1            | Statement about | No change - not |
| FContent/ \@USE |                 | intended use of | recommended     |
|                 |                 | the embedded    |                 |
|                 |                 | file            |                 |
+-----------------+-----------------+-----------------+-----------------+

**Table 9 - Differences between the AIP METS and the DIP METS on node
level: filesec**

**Node level: structmap**

+-----------------+-----------------+-----------------+-----------------+
| **Element/      | **Cardinality** | **Description   | **Change for    |
| Attribute **    |                 | and usage**     | DIP**           |
+=================+=================+=================+=================+
| structMap       | 1..n            | Each METS file  | No change       |
|                 |                 | needs to        |                 |
|                 |                 | include exactly |                 |
|                 |                 | one *structMap* |                 |
|                 |                 | element used    |                 |
|                 |                 | exactly as      |                 |
|                 |                 | described in    |                 |
|                 |                 | this table.     |                 |
|                 |                 | Institutions    |                 |
|                 |                 | can add their   |                 |
|                 |                 | own additional  |                 |
|                 |                 | custom          |                 |
|                 |                 | structural maps |                 |
|                 |                 | as separate     |                 |
|                 |                 | *structMap*     |                 |
|                 |                 | sections.       |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@ID            | 0..1            | Optional, but   | No change       |
|                 |                 | if used must be |                 |
|                 |                 | unique within   |                 |
|                 |                 | the package     |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@TYPE          | 1..1            | Mandatory in    | No change       |
|                 |                 | this            |                 |
|                 |                 | specification.  |                 |
|                 |                 | The value must  |                 |
|                 |                 | be "physical"   |                 |
+-----------------+-----------------+-----------------+-----------------+
| \@LABEL         | 1..1            | Mandatory in    | No change       |
|                 |                 | this            |                 |
|                 |                 | specification.  |                 |
|                 |                 | The value must  |                 |
|                 |                 | be "Common      |                 |
|                 |                 | Specification   |                 |
|                 |                 | structural map" |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div            | 0..n            | Each folder     | No change       |
|                 |                 | (and            |                 |
|                 |                 | sub-folder)     |                 |
|                 |                 | within the      |                 |
|                 |                 | package must be |                 |
|                 |                 | represented by  |                 |
|                 |                 | an occurrence   |                 |
|                 |                 | of the \<div\>  |                 |
|                 |                 | element. Please |                 |
|                 |                 | note that       |                 |
|                 |                 | sub-folders     |                 |
|                 |                 | must be         |                 |
|                 |                 | represented as  |                 |
|                 |                 | nested div      |                 |
|                 |                 | elements.       |                 |
|                 |                 |                 |                 |
|                 |                 | Example:        |                 |
|                 |                 |                 |                 |
|                 |                 | \<structMap     |                 |
|                 |                 | TYPE=\"physical |                 |
|                 |                 | \"              |                 |
|                 |                 | LABEL=\"Common  |                 |
|                 |                 | Specification   |                 |
|                 |                 | structural      |                 |
|                 |                 | map\"\>         |                 |
|                 |                 |                 |                 |
|                 |                 |   \<div         |                 |
|                 |                 | LABEL=\"Package |                 |
|                 |                 | 123\"\>         |                 |
|                 |                 |                 |                 |
|                 |                 |      \<div      |                 |
|                 |                 | LABEL=\"metadat |                 |
|                 |                 | a\"\>           |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/\@ID       | 1..1            | Mandatory,      | No change       |
|                 |                 | identifier must |                 |
|                 |                 | be unique       |                 |
|                 |                 | within the      |                 |
|                 |                 | package         |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/\@TYPE     | 0..1            | No specific     | No change       |
|                 |                 | requirements    |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/\@LABEL    | 1..1            | Mandatory,      | No change       |
|                 |                 | value must be   |                 |
|                 |                 | the name of the |                 |
|                 |                 | folder          |                 |
|                 |                 | ("**metadata**" |                 |
|                 |                 | ,               |                 |
|                 |                 | "**descriptive* |                 |
|                 |                 | *",             |                 |
|                 |                 | "**schemas**",  |                 |
|                 |                 | "**representati |                 |
|                 |                 | ons**",         |                 |
|                 |                 | etc). The LABEL |                 |
|                 |                 | value of the    |                 |
|                 |                 | first *div*     |                 |
|                 |                 | element in the  |                 |
|                 |                 | package is the  |                 |
|                 |                 | ID of the       |                 |
|                 |                 | package         |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/\@DMDID    | 0..1            | ID attribute    | Add/Update      |
|                 |                 | values          |                 |
|                 |                 | identifying the |                 |
|                 |                 | *dmdSec*,       |                 |
|                 |                 | elements in the |                 |
|                 |                 | METS document   |                 |
|                 |                 | that contain or |                 |
|                 |                 | link to         |                 |
|                 |                 | descriptive     |                 |
|                 |                 | metadata        |                 |
|                 |                 | pertaining to   |                 |
|                 |                 | the structural  |                 |
|                 |                 | division        |                 |
|                 |                 | represented by  |                 |
|                 |                 | the current     |                 |
|                 |                 | *div* element   |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/\@ADMID    | 0..1            | No specific     | Add/Update      |
|                 |                 | requirements    |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/\@ORDER    | 0               | Not used in the | No change       |
|                 |                 | specific Common |                 |
|                 |                 | Specification   |                 |
|                 |                 | *structMap*     |                 |
|                 |                 | occurrence      |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/           | 0               | Not used in the | No change       |
| \@ORDERLABEL    |                 | specific Common |                 |
|                 |                 | Specification   |                 |
|                 |                 | *structMap*     |                 |
|                 |                 | occurrence      |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/           | 0..1            | IDs for the     | No change       |
| \@CONTENTIDS    |                 | content in this |                 |
|                 |                 | division. No    |                 |
|                 |                 | specific use    |                 |
|                 |                 | requirements.   |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/fptr       | 0..n            | If the folder   | Add/Update      |
|                 |                 | which is        |                 |
|                 |                 | described by    |                 |
|                 |                 | the *div*       |                 |
|                 |                 | element         |                 |
|                 |                 | includes        |                 |
|                 |                 | computer files  |                 |
|                 |                 | these must be   |                 |
|                 |                 | referenced by   |                 |
|                 |                 | using the       |                 |
|                 |                 | *fptr* element. |                 |
|                 |                 |                 |                 |
|                 |                 | The only        |                 |
|                 |                 | exception is    |                 |
|                 |                 | the description |                 |
|                 |                 | of              |                 |
|                 |                 | representations |                 |
|                 |                 | (see below for  |                 |
|                 |                 | the use of      |                 |
|                 |                 | *mptr*).        |                 |
|                 |                 |                 |                 |
|                 |                 | The *fptr*      |                 |
|                 |                 | child elements  |                 |
|                 |                 | *par*, *seq*    |                 |
|                 |                 | and *area* must |                 |
|                 |                 | not be used.    |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/fptr/\@ID  | 0..1            | No specific     | No change       |
|                 |                 | requirements    |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/ fptr/     | 1..1            | Mandatory, must | Add/Update      |
| \@FILEID        |                 | be the ID used  |                 |
|                 |                 | in the          |                 |
|                 |                 | appropriate     |                 |
|                 |                 | *file* or       |                 |
|                 |                 | *mdRef* element |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/ fptr/     | 0..1            | IDs for the     | No change       |
| \@CONTENTIDS    |                 | content         |                 |
|                 |                 | referenced by   |                 |
|                 |                 | this *fptr*     |                 |
|                 |                 | element. No     |                 |
|                 |                 | specific        |                 |
|                 |                 | requirements    |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/div/mptr   | 0..n            | In the case of  | No change       |
|                 |                 | describing      |                 |
|                 |                 | representations |                 |
|                 |                 | within the      |                 |
|                 |                 | package (i.e.   |                 |
|                 |                 | representations |                 |
|                 |                 | /representation |                 |
|                 |                 | 1)              |                 |
|                 |                 | the content of  |                 |
|                 |                 | the             |                 |
|                 |                 | representations |                 |
|                 |                 | must not be     |                 |
|                 |                 | described.      |                 |
|                 |                 | Instead the     |                 |
|                 |                 | \<div\> of the  |                 |
|                 |                 | specific        |                 |
|                 |                 | representation  |                 |
|                 |                 | should include  |                 |
|                 |                 | one and only    |                 |
|                 |                 | one occurrence  |                 |
|                 |                 | of the \<mptr\> |                 |
|                 |                 | element,        |                 |
|                 |                 | pointing to the |                 |
|                 |                 | appropriate     |                 |
|                 |                 | representation  |                 |
|                 |                 | METS file.      |                 |
|                 |                 |                 |                 |
|                 |                 | The references  |                 |
|                 |                 | to              |                 |
|                 |                 | representation  |                 |
|                 |                 | METS files must |                 |
|                 |                 | be made using   |                 |
|                 |                 | the XLink href  |                 |
|                 |                 | attribute and   |                 |
|                 |                 | the file        |                 |
|                 |                 | protocol using  |                 |
|                 |                 | the relative    |                 |
|                 |                 | location of the |                 |
|                 |                 | file.           |                 |
|                 |                 |                 |                 |
|                 |                 | Example:        |                 |
|                 |                 | xlink:href=\"fi |                 |
|                 |                 | le:representati |                 |
|                 |                 | on/             |                 |
|                 |                 | representation1 |                 |
|                 |                 | /mets.xml\"     |                 |
|                 |                 |                 |                 |
|                 |                 | The XLink type  |                 |
|                 |                 | attribute is    |                 |
|                 |                 | used with the   |                 |
|                 |                 | fixed value     |                 |
|                 |                 | "simple".       |                 |
|                 |                 |                 |                 |
|                 |                 | Example:        |                 |
|                 |                 | xlink:type=\"si |                 |
|                 |                 | mple\"          |                 |
|                 |                 |                 |                 |
|                 |                 | The LOCTYPE     |                 |
|                 |                 | attribute is    |                 |
|                 |                 | used with the   |                 |
|                 |                 | fixed value     |                 |
|                 |                 | "URL"           |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/ div/      | 0..1            | Unique ID for   | No change       |
| mptr/\@ID       |                 | this element    |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/ div/      | 0..1            | The locator     | No change       |
| mptr/ \@LOCTYPE |                 | type used in    |                 |
|                 |                 | the xlink:href  |                 |
|                 |                 | attribute       |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/ div/      | 0..1            | Locator type in | No change       |
| mptr/           |                 | xlink:href when |                 |
| \@OTHERLOCTYPE  |                 | LOCTYPE="OTHER" |                 |
+-----------------+-----------------+-----------------+-----------------+
| /div/ div/      | 0..1            | The content ID  | No change       |
| mptr/           |                 | for the content |                 |
| \@CONTENTIDS    |                 | represented by  |                 |
|                 |                 | the *mptr*      |                 |
|                 |                 | element.        |                 |
+-----------------+-----------------+-----------------+-----------------+

**Table 10 - Differences between the AIP METS and the DIP METS on node
level: structmap**
