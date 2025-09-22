# Image Entity Recognition System

An advanced AI-powered system for analyzing service industry images to extract detailed entities, brands, equipment, and service context for SEO optimization.

## ⚠️ IMPORTANT: API Keys Required

**You MUST have BOTH API keys to use this system:**
1. **Google Gemini API Key** - Get it free at: https://makersuite.google.com/app/apikey
2. **OpenAI API Key** (Paid) - Get it at: https://platform.openai.com/api-keys

Without both API keys, the system will NOT work.

## 🎯 Purpose

This system analyzes service industry images to understand what AI vision models "see", helping to:
- Ground SEO strategies in actual AI perception
- Generate comprehensive alt text for images
- Extract brands, equipment models, and service context
- Compare insights from multiple AI providers (Google Gemini & OpenAI)

## 🚀 Features

- **Dual AI Analysis**: Leverages both Google Gemini and OpenAI GPT-4o for comprehensive insights
- **Parallel Processing**: Processes 5 images simultaneously for faster analysis
- **Smart Retry Logic**: 3 attempts with exponential backoff for reliability
- **Response Caching**: Avoids reprocessing already-analyzed images
- **Entity Standardization**: Normalizes brand and equipment names for consistency
- **Excel Export**: Professional formatted output with multiple sheets
- **Rich Narratives**: Detailed descriptions similar to Google Lens analysis

## 📋 Prerequisites

- Python 3.8+
- **Google Gemini API key** (FREE)
- **OpenAI API key** (PAID - requires active billing)
- Windows OS (or adapt paths for other systems)

## 🔧 Installation

1. **Clone the repository:**
```bash
git clone https://github.com/parmisanal/ImageEntityRecognizer.git
cd ImageEntityRecognizer
```

2. **Install required packages:**
```bash
pip install -r requirements.txt
```

3. **CRITICAL: Set up your API keys:**
   - Copy `.env.example` to `.env`
   - Add your Gemini API key
   - Add your OpenAI API key
   - Without both keys, the system will fail

```bash
# Copy the example file
copy .env.example .env

# Edit .env and add your keys:
GEMINI_API_KEY=your_actual_gemini_key_here
OPENAI_API_KEY=your_actual_openai_key_here
```

## 📁 Project Structure

```
ImageEntityRecognizer/
├── .env                                    # Your API keys (create from .env.example)
├── .env.example                           # Template for API keys
├── unconstrained_extraction_improved.py   # Main analysis script
├── RUN.bat                                # Windows batch launcher
├── images/                                # PUT YOUR IMAGES HERE
│   └── .gitkeep                          # Placeholder file
└── output_improved/                       # Output folder (created automatically)
    ├── narrative_analysis.xlsx           # Results spreadsheet
    └── progress.json                      # Processing progress
```

## 🏃‍♂️ Usage

### Step 1: Add Your Images
Place all images you want to analyze in the `images/` folder.
- Supported formats: `.jpg`, `.jpeg`, `.png`
- Any number of images
- The folder is empty by default

### Step 2: Ensure API Keys are Set
Make sure your `.env` file contains valid API keys:
```env
GEMINI_API_KEY=AIza...your_key_here
OPENAI_API_KEY=sk-...your_key_here
```

### Step 3: Run Analysis
Simply run:
```bash
RUN.bat
```

Or use Python directly:
```bash
python unconstrained_extraction_improved.py
```

### Test Mode (First 10 Images Only)
```bash
python unconstrained_extraction_improved.py --test
```

## 📊 Output

The system generates an Excel file (`output_improved/narrative_analysis.xlsx`) with:

### Main Sheet Columns:
- **filename**: Image file name
- **gemini_narrative**: Full Gemini analysis (1000+ chars)
- **gemini_brands**: Detected brands
- **gemini_equipment**: Equipment identified
- **gemini_service_type**: Type of service
- **gemini_response_time**: API response time
- **openai_narrative**: Full OpenAI analysis
- **openai_brands**: OpenAI detected brands
- **openai_equipment**: OpenAI equipment
- **openai_service_type**: OpenAI service type
- **openai_response_time**: API response time
- **processed_at**: Timestamp

### Summary Statistics Sheet:
- Total images processed
- Success rates for each API
- Average response times
- Performance metrics

## 🔄 How It Works

1. **Image Loading**: Loads images from `images/` folder
2. **Parallel Processing**: Batches 5 images for concurrent processing
3. **AI Analysis**:
   - Sends to Gemini 1.5 Pro for comprehensive analysis
   - Sends to OpenAI GPT-4o for additional perspective
4. **Entity Extraction**: Extracts brands, equipment, service types
5. **Standardization**: Normalizes entity names using predefined mappings
6. **Caching**: Saves responses to avoid reprocessing
7. **Excel Export**: Creates formatted spreadsheet with results

## 🤖 AI Models Used

### Google Gemini (FREE Tier Available)
- **Model**: `gemini-1.5-pro-latest`
- **Max Tokens**: 1000
- **Temperature**: 0.5
- **Best For**: Detailed technical analysis

### OpenAI (PAID - Requires Credits)
- **Model**: `gpt-4o`
- **Max Tokens**: 1000
- **Temperature**: 0.5
- **Best For**: Contextual understanding
- **Cost**: Approximately $0.01-0.02 per image

## ⚙️ Configuration

### Modify AI Prompts
Edit the prompts in `unconstrained_extraction_improved.py`:

```python
# Line 230-240 for Gemini prompt
prompt = """Analyze this service image..."""

# Line 330-340 for OpenAI prompt
```

### Adjust Batch Size
```python
# Line 709
analyzer = ImprovedImageAnalyzer(batch_size=5, max_retries=3)
```

## 🔍 Entity Standardization

The system automatically standardizes common variations:

```python
'balance point': ['Balance Point', 'BalancePoint', 'BP']
'ac unit': ['AC unit', 'air conditioner', 'cooling unit']
'installation': ['installation', 'install', 'installing']
```

## 📈 Performance

- **Processing Speed**: ~8-10 seconds per batch of 5 images
- **Cache Hit**: Instant for previously processed images
- **Retry Success**: 95%+ with exponential backoff

## 🐛 Troubleshooting

### "No images found" Error
- Make sure you've added images to the `images/` folder
- Supported formats: `.jpg`, `.jpeg`, `.png`

### API Key Errors
- Ensure both API keys are in your `.env` file
- Gemini key starts with `AIza...`
- OpenAI key starts with `sk-...`
- OpenAI requires active billing/credits

### "finish_reason: 2" Error
- This is a Gemini API issue with certain models
- The system automatically uses `gemini-1.5-pro-latest` which works

### Rate Limits
- System includes delays between batches
- Exponential backoff handles temporary failures

## 💰 Cost Estimation

- **Gemini**: FREE tier available (up to 60 requests/minute)
- **OpenAI**: ~$0.01-0.02 per image with GPT-4o
- **Example**: 100 images ≈ $1-2 total cost

## 🚦 API Requirements

### Google Gemini
- Free tier: 60 requests per minute
- No credit card required initially

### OpenAI
- Requires payment method on file
- Standard tier limits apply
- Approximately $0.01-0.02 per image

## 📝 License

MIT License - See LICENSE file for details

## 🤝 Contributing

Contributions welcome! Please follow existing code patterns.

## 📞 Support

For issues or questions:
- Open an issue on GitHub
- Check existing issues for solutions

---

**Note**: This system focuses on equipment and service context analysis for SEO optimization. It does not identify individuals.