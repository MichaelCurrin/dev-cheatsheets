---
title: RAG 
description: Retrieval Augmented Generation
---

## What is RAG?

RAG stands for **Retrieval-Augmented Generation**. It's an architectural pattern or technique used to improve the quality, accuracy, and relevance of responses generated by Large Language Models (LLMs).

RAG combines the strengths of information retrieval (finding relevant facts) with the generative power of LLMs (producing fluent, human-like text) to create more reliable and knowledgeable AI systems.

### Here's how it works

1.  **Retrieval:** When a user provides a prompt or asks a question, the RAG system first searches a predefined knowledge base (e.g., a set of documents, articles, internal wikis, databases) to find information relevant to the user's query. This search is often done by converting the query and the documents into vector embeddings and finding the closest matches in a vector store (like Chroma DB or using libraries like FAISS).
2.  **Augmentation:** The relevant information retrieved in the first step (often called "context") is then added to the original user prompt.
3.  **Generation:** This augmented prompt (original query + retrieved context) is then fed into the LLM.
4.  **Response:** The LLM generates a response based *both* on its internal knowledge *and* the specific, relevant context provided from the retrieval step.

### Key Benefits/Purpose of RAG

* **Reduces Hallucinations:** By grounding the LLM's response in specific, retrieved data, RAG significantly reduces the likelihood of the model generating incorrect or fabricated information.
* **Access to Up-to-Date/Domain-Specific Information:** Allows LLMs to answer questions based on information that wasn't part of their original training data, such as recent events, proprietary company knowledge, or specialized domain information.
* **Improved Accuracy and Relevance:** Responses are more likely to be factually correct and directly relevant to the user's query, as they are based on specific source material.
* **Transparency:** It's often possible to cite the sources (the retrieved documents) that were used to generate the answer, providing traceability.

### Generalized use cases for RAG

Focusing on the *scope and type of knowledge source* being queried:

1.  **Single-Document Question Answering:**
    * **Use Case:** Interacting with a single, often large or complex, document (e.g., a legal contract, a research paper, a technical manual, a book chapter).
    * **RAG Application:** Users ask questions in natural language, and the RAG system retrieves the most relevant passages *from that specific document* to generate a precise answer based solely on its contents.
2.  **Multi-Source Corpus Question Answering:**
    * **Use Case:** Querying a collection of diverse documents that have been ingested and indexed (e.g., a mix of internal PDFs, Word documents, saved web articles, database excerpts). This could be a project's documentation, a research archive, or a company's internal knowledge base.
    * **RAG Application:** The system retrieves relevant information from *across multiple documents and formats* within the ingested corpus to synthesize an answer, potentially combining insights from different sources.
3.  **Website-Specific Question Answering:**
    * **Use Case:** Allowing users to ask questions about the content available on one or more specific websites (e.g., a company's public website, a specific product website, a documentation portal).
    * **RAG Application:** The website's content is crawled, processed, and indexed. The RAG system retrieves relevant sections from the site's pages to answer user queries, acting like an intelligent, conversational site search.
4.  **Database Question Answering (Structured & Unstructured):**
    * **Use Case:** Interacting with data stored in databases (SQL or NoSQL) using natural language, without needing to write complex queries. This could involve tables with product information, customer records, logs, etc., potentially including unstructured text fields.
    * **RAG Application:** The system retrieves relevant database entries, schema information, or text fields based on the user's query. The LLM then uses this retrieved data to formulate an answer, summarize information, or even help construct a formal database query.
5.  **Real-Time Information Synthesis:**
    * **Use Case:** Answering questions that require up-to-the-minute information not available in static documents (e.g., current news headlines, latest stock prices, live weather updates, social media trends).
    * **RAG Application:** The retrieval step involves querying APIs or real-time data feeds. The fresh, retrieved data is then passed to the LLM to generate timely and relevant responses.
6.  **Codebase Understanding and Querying:**
    * **Use Case:** Helping developers understand or navigate large code repositories.
    * **RAG Application:** The system indexes source code files, documentation comments, commit messages, and related artifacts. Developers can ask questions like "How is user authentication handled?" or "Where is the database connection configured?", and the system retrieves relevant code snippets or docs to generate an explanation.

## Vector DBs

Store vectorized data in a DB for ease of searching. 


### SQL or NoSQL?
Vector databases are classified as a type of NoSQL database, specialized for handling vector embeddings.

As their core data model, primary query mechanism (similarity search), and often their schema flexibility diverge significantly from the relational model, 

### Which one to use?

These below can be stored in-memory, on disk, or hosted in the cloud.

Choose Chroma DB for ease of development, built-in RAG-relevant features (like metadata filtering), and faster setup. 

Consider using FAISS directly only if you have extreme scale requirements and need maximum performance tuning, and are prepared for the added complexity.

### Chroma DB

It's a user-friendly vector database that simplifies storing, managing, and querying embeddings along with their metadata. 

It handles persistence, updates, and metadata filtering easily, integrating well with RAG frameworks like LangChain.

### FAISS

A powerful, low-level library focused purely on highly efficient vector similarity search. 

It offers potentially top-tier performance and fine-grained control, especially at massive scales, but requires significant manual effort for indexing, data management, metadata handling, and integration into a full RAG system.

### Cloud hosting options

Plenty of cloud options exist for vector databases, falling into three main categories. The choice depends on your desired level of management, preferred cloud, performance needs, and budget.

- **Fully Managed Vector DB Services:** Providers handle everything. Examples include **Pinecone**, **Google Vertex AI Vector Search**, **Azure AI Search (Vector)**, **AWS OpenSearch (k-NN)**, plus managed offerings from vendors like **Zilliz (Milvus)**, **Weaviate**, **Qdrant**, **Chroma**, **MongoDB Atlas**, and **Redis Enterprise Cloud**.
- **Vector Features in Existing Cloud Databases:** Standard databases now offer vector search. The most common is **managed PostgreSQL with the `pgvector` extension** (available on AWS, GCP, Azure). Services like Azure Cosmos DB are also adding vector capabilities.
- **Self-Hosted on Cloud Infrastructure:** You can install open-source vector DBs (like Milvus, Weaviate, Qdrant, Chroma) yourself on cloud VMs (EC2, GCE, Azure VM) or container platforms (Kubernetes).
