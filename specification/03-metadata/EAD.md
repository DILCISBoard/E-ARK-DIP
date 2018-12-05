#### ​3.1.2.3​ EAD
Descriptive metadata are used to describe the intellectual contents of archival holdings, and they support finding and understanding individual information packages. The E-ARK DIP allows for the inclusion of any kind of descriptive metadata. These go into the 'descriptive/' folder as seen in the example below, Figure 3 (cf. EAD.xml).
E-ARK has chosen EAD3 as the descriptive metadata standard.

**Figure 3 - E-ARK IP descriptive metadata**
![](media/EAD_figure3.png)

The METS descriptive metadata element \<dmdSec\> references descriptive metadata as seen in Figure 4 below and as such descriptive metadata are not to be included into the METS file.
**Figure 4 - METS descriptive metadata**
![](media/EAD_figure4.png)

The EAD file has three main inputs (Figure 5 below):
-   Archival descriptions. Contains main archival descriptions (including metadata about aggregations and classification).
-   Content. Contains links to computer files and folders as \<dao\> elements and \@base attributes respectively.
-   Additional metadata. Specific information that does not fit into the EAD3 standard elements can be saved as \<odd\> elements or localtype attributes in EAD3 elements (see localtype example below in section 'Search').

**Figure 5 - Inputs to the EAD file**
![](media/EAD_figure5.png)

##### ​3.1.2.3.1​ Tools
Tools will by default only be able to cope with EAD3, because EAD3 is the descriptive metadata standard that E-ARK has chosen. This does not mean that the tools cannot be configured so they can also cope with other descriptive metadata standards. 

##### ​3.1.2.3.2​ Search
To support the development of a search interface, it is required to make certain metadata elements available in the Solr index[^55], either by using the Lily indexer[^56] or via the AIP indexing task, which adds content to the Solr index by creating one document[^57] per contained file in the IP. These Solr documents include basic properties such as \"path\", \"package\", \"contentType\", \"size\", and can be further enriched by running a subsequent job which parses EAD metadata files to search for \<dao\> tags. If such a tag is found, the metadata fields of the first c-level tag in the ancestry path of the \"data\" element (e.g. the \"title\" field) are added to the Solr document. If no \<dao\> element is found, the entire EAD/c (component) is indexed and associated with all files in a given IP. This aims to support scenarios where no \<dao\> elements are provided as part of the description.

[^55]: Apache Solr Reference Guide Solr Indexing https://cwiki.apache.org/confluence/display/solr/Introduction+to+Solr+Indexing

[^56]: The dm-file-ingest component: https://github.com/eark-project/dm-file-ingest

[^57]: A document in Solr terminology is Solr\'s basic unit of information, which is a set of data that describes something. A document about a person, for example, might contain the person\'s name, biography, favorite color, and shoe size. A document about a book could contain the title, author, year of publication, number of pages, and so on. Cf. Apache Solr Reference Guide Overview of Documents, Fields, and Schema Design https://cwiki.apache.org/confluence/display/solr/Overview+of+Documents,+Fields,+and+Schema+Design

The following fields have been mapped to Solr and created in Lily\_Solr and are thus indexed and searchable from the E-ARK Search GUI:

**Table 14 - EAD to Solr mapping**

  **EAD element**                 |**Value access path**        |**SolR field**
  ------------------------------- |----------------------------| ----------------------------------
  ead:unitid                      |.                            |eadid\_s (String)
  ead:unittitle                   |.                            |eadtitle\_s (String)
  ead:unitdate                    |.                            |eaddate\_s (String)
  ead:unitdatestructured          |ead:datesingle               |eaddatestructuredfrom\_dt (Date)
  ead:unitdatestructured,         |ead:datesingle               |eaddatestructuredto\_dt (Date)
  ead:unitdatestructured          |ead:daterange/ead:fromdate   |eaddatestructuredfrom\_dt (Date)
  ead:unitdatestructured          |ead:daterange/ead:todate     |eaddatestructuredto\_dt (Date)
  ead:origination                 |ead:\*/ead:part              |eadorigination\_s (String)
  ead:abstract                    |.                            |eadabstract\_t (Text)
  ead:accessrestrict              |ead:head                     |eadaccessrestrict\_s (String),
  ead:(\[Cc\]\[0,1\]\[0-9\]\|C)   |\@level (attribute)          |eadclevel\_s (String)

Note that the element selector can be a regular expression: (\[Cc\]\[0,1\]\[0-9\]\|C) matches either C01, C02, ..., C20 or the C-element without numeric suffix. The value access path "\@level (attribute)" means that the value of the attribute "level" of the selected C- or C{n}element is accessed. The expression ead:\*/ead:part allows accessing the element's value with any EAD child element of ead:origination which has the child element ead:part.

Elements which are not part of the original EAD3 can be represented by \<odd\> elements.

For example a new element for keywords:

**Table 15 - EAD example of new element for keywords**
```xml
<c level="item">
 <did>
  …
   <!--System set date and time when the entity was created. “Created” is user-defined value.-->
   <unitdate datechar="created">2004-05-25T00:00:00</unitdate>
  …
   <!--Other Descriptive Data. “Keyword” attribute is user-defined.-->
  <odd localtype="Keyword">
   <list>
    <item>keyword A</item>
    <item>keyword B</item>
    <item>keyword C</item>
   </list>
  </odd>
```

##### ​3.1.2.3.3​ Hierarchical archival descriptions
The component tag (\<c\>) is "An element that designates a subordinate part of the materials being described."[^59]. The hierarchical archival descriptions (units of description) will be addressed using the unnumbered component tag (\<c\>).

[^59]: EAD3 \<c\> http://www.loc.gov/ead/EAD3taglib/index.html\#elem-c

The Access Software will be developed so that it can address all hierarchical levels in a description of the Archive\'s collections, thus providing user friendly information for all the levels of intellectual content, which have effectively been described in the descriptive metadata file.

The example below shows how the descriptions of the hierarchical levels can be displayed in the IP Viewer:

**Figure 6 - Illustration of the E-ARK use of the EAD component tag \<c\>**
![](media/EAD_figure6.png)

The E-ARK project has chosen the unnumbered component tag (\<c\>) as opposed to the numbered one (\<cNN\>) because it is more generic, less resource demanding to implement, and because it provides more flexibility and more interoperability: First of all there is no upper limit to the number of levels when choosing \<c\> (whereas there are 12 in \<cNN\>). Also, a hierarchy is implicit from the archive\'s vocabulary (series, sub-series, etc.) and reflects each local archive's way of describing descriptive units; the \<c\> component is defined as an argument using the level (\@level) attribute[^60], e.g. \<c level=\"file\"\>. With \<cNN\> we would need to define the meaning for each number and it would probably be too naive to expect that a prescriptive E-ARK solution would be adopted by all. Furthermore, it is also complicated to introduce new levels between the existing ones when using the \<cNN\> tag. Lastly, the Archives Portal Europe (APE) also uses the unnumbered tag in apeEAD and it is assumed that any compliance with APE is welcomed by the archival community.

[^60]: EAD3 \@level https://www.loc.gov/ead/EAD3taglib/index.html\#attr-level

EAD uses aggregation values as the "level" attribute on the elements \<archdesc\> and \<c\> to specify the aggregation level at which description belongs.

**Table 16 - EAD example of the use of the "level" attribute to specify the aggregation levels**
```xml
<archdesc level="fonds">
…
 <dsc>
  <c level="series">
   …
   <c level="file">
    Records and computer files
   </c>
  </c>
 </dsc>
</archdesc>
```

The exact names of aggregation levels depend on the agreements between data producers and archives. EAD3 has defined a set of values (class, collection, file, fonds, item, otherlevel, recordgrp, series, subfonds, subgrp, subseries) for that purpose, but it allows using other values as well if they are defined with the \@otherlevel attribute.
**Table 17 - EAD example of the use of \<otherlevel\>**
```xml
<archdesc level="collection">
 <did>
  <abstract>...</abstract>
 </did>
 <dsc>
  <c level="series">
   <did>
    <abstract></abstract>
   </did>
   <c otherlevel="case"> <!--A new aggregation level-->
    <did>
     <abstract>Records and computer files from ....</abstract>
    </did>
   </c>
  </c>
 </dsc>
</archdesc>
```

##### ​3.1.2.3.4​ Referencing files and folders from EAD
In order to be able to reference physical intellectual entities from within an EAD file, two mechanisms are being used: The digital archival object \<dao\> tag and the \@base attribute.

\@base is used to reference folders; \<dao\> is used to reference files.

The objectives of these mechanisms are to:
-   Connect findings in the Finding Aid to specific descriptive units in the IPs (be it files (\<dao\>) or folders (\@base));
-   Allow for an appropriate visualisation of both data and EAD metadata inside the E-ARK Access Software GUIs.

The digital archival object \<dao\> tag is "A child element of \<did\> used for linking to born digital records or a digital representation of the materials being described."[^61]. The \<did\> element is a wrapper element that encloses information essential for identifying the record:

[^61]: EAD3 \<dao\> http://www.loc.gov/ead/EAD3taglib/index.html\#elem-dao

###### ​3.1.2.3.4.1​ The \<did\> tag
The \<did\> tag is "a wrapper element that encloses information essential for identifying the material being described".[^62]. It binds together the elements that describe archival materials.

[^62]: EAD3 \<did\> https://www.loc.gov/ead/EAD3taglib/index.html\#elem-did

**Table 18 - EAD example of the \<did\> element**
```xml
  <did>
  <!--Unique identifier for a record that is generated automatically by the system.-->
  <unitid localtype="current">ERA.14-4-3-1-1</unitid>
  <!--The identifying name or title of the record.-->
  <unittitle>Final report</unittitle>
  <!--System set date and time when the entity was created. Can be represented as unitdatestructured or unitdate.-->
  <unitdate datechar="created">2004-05-25T00:00:00</unitdate>
  <!--The unit used to describe the extent of the record (e.g MB, pages, num of files/components)-->
  <physdescstructured coverage="whole" physdescstructuredtype="spaceoccupied">
      <quantity>0.4453</quantity>
      <unittype>MB</unittype>
  </physdescstructured>
  <!--<daoset> allows grouping multiple links to born digital records or digital representations of the materials being     described. If only one link is present then the <daoset> element can be replaced by <dao>.-->
  <daoset label="Digital Objects">
      <dao … />
      <dao … />
  </daoset>
</did>
```

###### ​3.1.2.3.4.2​ The \<dao\> tag and the \@base attribute
Both mechanisms are used to link to physical entities within an IP. The dao element links to files while the base attribute links to folders. It allows the Access Software to display metadata pertaining to specific files or folders so that the Consumer can easily understand what the selected element is about.

**The dao element**
The \<dao\> element is a linking element that uses href to connect to born digital records or digital representations of the record.

**Table 19 - EAD example of the \<dao\> element and the href link**
```xml
<dao id="dad603af-037b-44d5-8993-5754a42b3962" daotype="borndigital" linktitle="Report" href=file:../../representations/rep1/data/Example1.docx" />
```
The ID attribute represents a machine-processable unique identifier for the file. The daotype specifies if a file is born digital (borndigital), digitized from physical holdings (derived) or other (otherdaotype). For example, for scanned files we can point out that the files are not "original".

**Table 20 - EAD example of the \<daotype\> attribute**
```xml
<dao id="baa703af-037b-44d5-8993-5754a42b3962" daotype="derived" linktitle="Page10" href="file:../../representations/rep1/data/Page10.tif" />
```
In more complex cases (e.g. files migration) it is recommended to use both attributes (daotype, otherdaotype) as using only one attribute may be not enough for describing the file origin. For example, if a file is a result of a file format conversion from DOCX to PDF/A then we recommend using daotype=\"borndigital\" otherdaotype=\"migrated\" because the PDF/A is a born-digital and a migrated file in the same time.

**Table 21 - EAD examples of the \<daotype\> and \<otherdaotype\> attributes**
```xml
<dao id="dad603af-037b-44d5-8993-5754a42b3962" daotype="borndigital" linktitle="Report" href="file:../../representations/rep1/data/Report.doc" />

<dao id="aad248bf-037b-34d5-7993-5754b42b3971" daotype="borndigital" otherdaotype="migrated" linktitle="Report" href="file:../../representations/rep2/data/Report.pdf" />
```

**The base attribute**
The \@base attribute is "Used to specify a base URI that is different than the base URI of the EAD instance. This allows any relative URIs provided on attributes of a specific element or its descendants to be resolved using the URI provided in that element's base"[^63].

[^63]: EAD3 \@base https://www.loc.gov/ead/EAD3taglib/index.html\#attr-base

**Table 22 - EAD examples of the base attribute**
```xml
<c level="subseries" base="representations/[repID]/data/[seriesfolder]/[subseriesfolder]">
```

For reasons that have already been explained above, the \<dao\> element is not mandatory and as such an IP can just be described as a whole - ignoring all hierarchical levels -, for example using the \<abstract\> tag. The \@base is not mandatory either.

The path used in \@base is always absolute for reasons of efficiency when matching paths to folders. According to the EAD3 tag library doc, the data type of the base attribute is anyURI. The definition of anyURI is: \"A Uniform Resource Identifier. This may be a Uniform Resource Locator (URL) or a Uniform Resource Name (URN). Both relative and absolute URIs are allowed."[^64]

[^64]: Encoded Archival Description Tag Library, page 6, http://www2.archivists.org/sites/all/files/TagLibrary-VersionEAD3.pdf

###### ​3.1.2.3.4.3​ Access restrictions
The \<accessrestrict\> tag is "An element for information about conditions that affect the availability of the materials being described."[^65]**.** The Access Rights Information that concerns the *end-user* has to be available in EAD - not in PREMIS - and \<accessrestrict\> is used for this purpose. The reasons being:

[^65]: EAD3 \<accessrestrict\> http://www.loc.gov/ead/EAD3taglib/index.html\#elem-accessrestrict

-   It should be possible to find the Access Rights Information in one place and one place only, namely in the descriptive metadata, which, per default, are the metadata displayed in the Access Software (Finding Aids and different viewers).
-   EAD supports the description of potentially very complex hierarchical levels of an IP and can therefore if necessary differentiate access restrictions all the way down to the individual file level.
-   Descriptive metadata are very often added upon Ingest and Finding Aids can thus immediately be populated with this kind of information.

The \<p\> tag in \<accessrestrict\> is repeatable and can be used in the following way:

**Table 23 - EAD example of \<accessrestrict\>**
```xml
<accessrestrict>
 <p>Restricted</p>
 <p>75</p>
 <p>...</p>
</accessrestrict>
```

If the value of the first \<p\> is "Restricted" or "" (empty - which also means that it is restricted) the tool will look for a second \<p\> which specifies the restriction period. "Unrestricted" means that the IP is immediately accessible. The second \<p\> can contain any text, for example \<p\>This IP is available 20 years from November 14 2002\</p\>.

Note that the EAD3 schema validates even without the \<head\> tag inside \<accessrestrict\>.

For more complex scenarios, it is possible to use \<chronlist\> as follows:

**Table 24 - EAD example of \<chronlist\>**
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

##### ​3.1.2.3.5​ Representations
Whenever new representations are created, a new EAD file needs to be created to include the new file items of the new representation. It replaces the old one for which a backup file with the date suffix is created at each edit. However, the IP will still only include one valid EAD file (in the 'metadata/descriptive/' folder), which references all the representations of an IP.

#### ​3.1.2.4​ Representation Information
Representation Information is particularly important to Access since it is the information which is required to understand and render both data and metadata, or, as it is stated in the OAIS, p. 1-13[^66]: "Representation Information: The information that maps a Data Object into more meaningful concepts. An example is the ASCII definition that describes how a sequence of bits (i.e., a Data Object) is mapped into a symbol."

[^66]: OAIS, blue book, 2002 https://siarchives.si.edu/sites/default/files/pdfs/650x0b1.PDF

Representation Information can be subdivided into three classes:

-   **Structural Information**: describes the format and data structure concepts to be applied to the bitstream, which result in more meaningful values like characters or number of pixels. 
-   **Semantic Information**: this is needed on top of the structural information. If the digital object is interpreted by the structural information as a sequence of text characters, the semantic information should include details of which language is being expressed.
-   **Other Representation Information**: includes information about relevant software, hardware and storage media, encryption or compression algorithms, and printed documentation.

The Representation Information can be executable software, if that's helpful. Rather than having further Representation Information which defines what a PDF is, it's more helpful to simply use a PDF viewer, instead[^67]. The OAIS needs to track this carefully though, because, one day, PDF viewers may cease to exist or work properly, and the original Representation Information would then need to be updated, together with other preservation strategies like file format migration or emulation, which will bring new requirements to the necessary representation information.

[^67]: OAIS, blue book, pp. 4-21/22.

In the E-ARK projekt, we cover representation in different ways. For example by the use of the Documentation folder which is presented as a container where one can place all the information that one has collected during the pre-ingest phase which somehow helps the archivist and the Consumer to better understand the data stored in the IP. This folder fulfils well the requirements of the transfer of archival material from the producer to the archive. One does not want to over complicate the SIP creation step that is already a huge burden for most producers. Having a container that allows producers to include whatever extra documentation or information they have that may help to understand the data is a very welcome feature. Other examples of Representation Information in the E-ARK IP is the use of PREMIS to indicate rendering software of the use of EAD to increase the understandability of the preserved archival material.

On a long term, the E-ARK project proposes the use of relationship model that would enable the creation of links between an AIP and one or more "Representation Information packages". These "Representation Information packages" could very easily follow the same structure of the current E-ARK AIP, meaning that they could be composed of a metadata folder, representation folders, and all the other components that currently make up the E-ARK AIP. This particular type of AIP should be branded differently so it doesn't get confused with the regular AIPs (e.g. via a different type/role on the METS that wraps the entire AIP).

By following this strategy one could build an entire Representation Information network that follows the current specification so we could actually make use of the existing preservation action tools being developed in the project to preserve the RI. Moreover, exchanging RI in this standard way would greatly increase collaboration between institutions, enterprises and preservation experts while at the same time reducing the risk of an external registry going out of business.

The current AIP specification already includes a specific relationship between AIPs, namely a succession relationship, where an AIP point to its parent AIP (or AIC). We suggest using the same mechanism to refer to RI AIPs. The implementation would entail adding a new struct-map where the relationships with RI AIPs could be defined, and possibly also other links to external information (e.g. to the PRONOM registry). Also, we suggest adding a new AIP type called "Representation Information" which would clearly identify the AIP as not being part of the content of the repository *per se*, but extra information needed for the preservation of said content.
