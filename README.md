# RAG Jupyter Notebook Tutorials

A collection of hands-on tutorials for building Retrieval Augmented Generation (RAG) systems using Jupyter notebooks. These tutorials cover fundamental concepts like PDF processing, text chunking, embeddings, and vector databases.

## Notebook Index

### 1. Reading PDF and Page Chunking Tutorial
**File:** `reading_pdf_chunking_tutorial.ipynb`

**Description:** Learn the fundamentals of PDF processing for RAG systems. This beginner-friendly tutorial covers:
- Loading PDF documents using LangChain's PyMuPDFLoader
- Extracting text content page by page
- Understanding automatic page-based document chunking
- Inspecting document metadata
- Working with Document objects for downstream processing

**Key Concepts:**
- PDF text extraction
- Page-based chunking
- Metadata preservation
- LangChain document loaders

**Prerequisites:** Basic Python knowledge  
**Estimated Time:** 15-20 minutes

### 2. Data Chunking Tutorial
**File:** `data_chunking_tutorial.ipynb`

**Description:** Explore advanced text chunking strategies for RAG systems. This intermediate tutorial covers:
- Fixed-size chunking with CharacterTextSplitter
- Recursive chunking with RecursiveCharacterTextSplitter
- Sentence-based chunking using NLTK
- Semantic chunking by paragraph boundaries
- Comparing different chunking methods and their trade-offs
- Hands-on activity with customizable parameters

**Key Concepts:**
- Text splitting strategies
- Chunk size and overlap optimization
- Context preservation techniques
- Semantic boundary detection

**Prerequisites:** Basic Python knowledge, completion of Reading PDF tutorial recommended  
**Estimated Time:** 30-40 minutes

### 3. Documents to Embeddings Tutorial
**File:** `documents_to_embeddings_tutorial.ipynb`

**Description:** Learn how to convert text documents and chunks into vector embeddings for semantic search and retrieval. This tutorial covers:
- What embeddings are and why they matter for RAG
- Generating embeddings using Word2Vec and OpenAI's API
- Comparing embedding strategies and their outputs
- Preparing data for vector-based retrieval

**Key Concepts:**
- Word embeddings
- Semantic search
- Vector databases
- LangChain/OpenAI integration

**Prerequisites:** Completion of chunking tutorials recommended  
**Estimated Time:** 30-40 minutes

---

## Setup Instructions

### Prerequisites
- Python 3.8 or higher
- Conda (Miniconda or Anaconda)

### Installing Jupyter Lab

#### Windows 10/11
```bash
# Using conda with conda-forge (recommended)
conda install -c conda-forge jupyterlab

# Alternative: Using pip
pip install jupyterlab
```

**Why use conda-forge?**
- **More up-to-date packages**: conda-forge often has newer versions than the default conda channels
- **Better package compatibility**: Packages are built with consistent dependencies
- **Community-maintained**: Active community ensures quality and rapid updates
- **Broader package selection**: Many packages are only available through conda-forge

#### Linux (Ubuntu)
```bash
# Update package list
sudo apt update

# Install pip if not already installed
sudo apt install python3-pip

# Using conda with conda-forge (recommended)
conda install -c conda-forge jupyterlab

# Alternative: Using pip
pip install jupyterlab
```

### Starting Jupyter Lab

#### Windows
Use the provided batch script (customize paths first):
```bash
Windows_Start_Jupyter_Lab_Server.bat
```

**About the Windows Batch Script:**
The `Windows_Start_Jupyter_Lab_Server.bat` file is a convenient startup script that:
- Automatically navigates to the project directory
- Activates your conda environment
- Starts Jupyter Lab with no browser and disabled authentication
- Accepts command line arguments for customization

**Important:** Before using the batch script, you need to customize the default paths in the script to match your system:
- Edit `DEFAULT_ROOT_DIR` to point to your project directory
- Edit `DEFAULT_MINICONDA_SCRIPTS_DIR` to point to your conda Scripts folder
- Set `DEFAULT_CONDA_ENV` to your conda environment name

**Usage:**
```bash
# Use default settings (after customizing the script)
Windows_Start_Jupyter_Lab_Server.bat

# Or provide paths as command line arguments
Windows_Start_Jupyter_Lab_Server.bat "C:\your\project\path" "C:\your\miniconda3\Scripts" "your_env_name"
```

Or start manually:
```bash
jupyter lab --no-browser --port=8888
```

#### Linux
```bash
jupyter lab --no-browser --port=8888
```

---

## Connecting to Jupyter Lab Server

After starting the Jupyter Lab server using the batch script or command line, you'll need to connect to it through your web browser. Here's how:

### Step 1: Copy the Server URL
When Jupyter Lab starts, it displays server URLs in the terminal. Look for output similar to:

![Server startup output showing URLs](images/jupyter_server_url.png)

The server will display URLs like:
- `http://localhost:8888/lab`
- `http://127.0.0.1:8888/lab`

### Step 2: In VS Code - Select Kernel

![Browser with Jupyter Lab URL](images/select_kernel_1.png)

### Step 3: In VS Code - Select Existing Jupyter Server

![Jupyter Lab main interface](images/select_kernel_2.png)

### Step 4: In VS Code - Paste the URL

![File browser showing notebooks](images/select_kernel_3.png)

### Step 5: In VS Code - Answer Yes

![Opening a notebook](images/select_kernel_4.png)

### Step 6: In VS Code - Select localhost

![Notebook running with outputs](images/select_kernel_5.png)

### Step 7: In VS Code - Select our conda env langchain_common_py3.12

![Terminal showing running server](images/select_kernel_6.png)

**Important Notes:**
- Don't close the terminal window while using Jupyter Lab
- To stop the server, press `Ctrl+C` in the terminal
- The server URL includes `localhost` or `127.0.0.1` - this means it's only accessible from your local machine
- If you need to restart the server, just run the batch script again

---

## Python Dependencies

### Testing Required Modules
Before running the notebooks, test if required modules are installed in your conda environment:

```python
# Test script to check if required modules are available
import sys

required_modules = [
    'langchain',
    'langchain_community',
    'langchain_text_splitters',
    'fitz',  # PyMuPDF (imported as fitz)
    'nltk',  # Natural Language Toolkit for sentence tokenization
    'gensim',  # For Word2Vec embeddings
    'os',
    'pandas',
    'numpy'
]

missing_modules = []

for module in required_modules:
    try:
        __import__(module)
        print(f"✅ {module} - Available")
    except ImportError:
        print(f"❌ {module} - Missing")
        missing_modules.append(module)

if missing_modules:
    print(f"\nInstall missing modules with pip (see installation guide below)")
else:
    print("\n🎉 All required modules are available!")
```

### Installing Required Dependencies

Create a `requirements.txt` file and install dependencies:

```bash
# Create requirements.txt with the following content:
# langchain
# langchain-community
# langchain-text-splitters
# langchain_openai
# PyMuPDF
# nltk
# gensim
# pandas
# numpy
# jupyterlab
# openai

# Install all requirements
pip install -r requirements.txt

# Or install individually
pip install langchain langchain-community langchain-text-splitters langchain_openai PyMuPDF nltk gensim pandas numpy jupyterlab openai
```

### Using Conda Environment (Recommended)
```bash
# Create a new conda environment with Python 3.12
conda create -n langchain_common_py3.12 python=3.12

# Activate the environment
conda activate langchain_common_py3.12

# Install available packages using conda-forge
conda install -c conda-forge langchain nltk pandas numpy jupyterlab

# Install packages via pip (not available in conda-forge)
pip install langchain-community langchain-text-splitters PyMuPDF gensim openai langchain_openai

# Download required NLTK data
python -c "import nltk; nltk.download('punkt')"
```

**Note about langchain-community and PyMuPDF:** These packages are not available through conda-forge, so they must be installed using pip even within a conda environment. This is a common pattern for specialized packages.

### Alternative: Using Python venv
```bash
# Create a virtual environment
python -m venv rag_tutorials_env

# Activate the environment
# Windows:
rag_tutorials_env\Scripts\activate
# Linux/Mac:
source rag_tutorials_env/bin/activate

# Install dependencies
pip install langchain langchain-community PyMuPDF nltk gensim pandas numpy jupyterlab langchain_openai
```

### Alternative: Using uv (Fast Python Package Manager)
[uv](https://github.com/astral-sh/uv) is a fast Python package installer and resolver, gaining popularity as a modern alternative:

```bash
# Install uv first
pip install uv

# Create a virtual environment with uv
uv venv rag_tutorials_env

# Activate the environment
# Windows:
rag_tutorials_env\Scripts\activate
# Linux/Mac:
source rag_tutorials_env/bin/activate

# Install dependencies with uv (much faster than pip)
uv pip install langchain langchain-community PyMuPDF nltk gensim pandas numpy jupyterlab langchain_openai
```

---

## Getting Started

1. Clone this repository
2. Set up your Python environment using the instructions above
3. Install required dependencies
4. Download required NLTK data: `python -c "import nltk; nltk.download('punkt')"`
5. Customize the batch script paths (Windows) or prepare your environment
6. Start Jupyter Lab using the provided batch script (Windows) or command line
7. Open the desired notebook and follow along

## Sample Data

The tutorials reference sample PDF files that you should provide:
- Place your PDF files in a `data/` directory
- Update the file paths in the notebooks to match your files
- Use the medical PDF resources listed in the notebooks for sample documents

## Resources

The notebooks include references to free, legal sources for medical PDFs that can be used for testing:
- CDC (Centers for Disease Control)
- NIH (National Institutes of Health) 
- WHO (World Health Organization)
- PubMed Central open access papers
- Medical education resources

## Contributing

Feel free to contribute additional tutorials, improvements, or bug fixes through pull requests.

## License

This project is open source and available under the MIT License.
