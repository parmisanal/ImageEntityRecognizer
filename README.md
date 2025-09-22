# Image Entity Recognition System

An advanced AI-powered system for analyzing HVAC/Electrical/Plumbing service images to extract detailed entities, brands, equipment, and service context for SEO optimization.

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
- Google Gemini API key
- OpenAI API key
- Windows OS (script uses Windows-specific paths)

## 🔧 Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/ImageEntityRecognizer.git
cd ImageEntityRecognizer
```

2. Install required packages:
```bash
pip install pandas openpyxl pillow google-generativeai openai python-dotenv
```

3. Create `.env` file with your API keys:
```env
GEMINI_API_KEY=your_gemini_api_key_here
OPENAI_API_KEY=your_openai_api_key_here
```

## 📁 Project Structure

```
ImageEntityRecognizer/
├── .env                                    # API keys (not in repo)
├── unconstrained_extraction_improved.py   # Main analysis script
├── RUN.bat                                # Windows batch launcher
├── X - Media - BP New Photos (Raw)/      # Image folder
└── output_improved/                       # Output folder
    ├── narrative_analysis.xlsx           # Results spreadsheet
    ├── progress.json                      # Processing progress
    └── cache_responses/                   # Cached API responses
```

## 🏃‍♂️ Usage

### Quick Start
Simply run the batch file:
```bash
RUN.bat
```

### Python Direct
```bash
python unconstrained_extraction_improved.py
```

### Test Mode (10 images)
```bash
python unconstrained_extraction_improved.py --test
```

## 📊 Output

The system generates an Excel file (`narrative_analysis.xlsx`) with:

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

1. **Image Loading**: Loads images from specified folder
2. **Parallel Processing**: Batches 5 images for concurrent processing
3. **AI Analysis**:
   - Sends to Gemini 1.5 Pro for comprehensive analysis
   - Sends to OpenAI GPT-4o for additional perspective
4. **Entity Extraction**: Extracts brands, equipment, service types
5. **Standardization**: Normalizes entity names using predefined mappings
6. **Caching**: Saves responses to avoid reprocessing
7. **Excel Export**: Creates formatted spreadsheet with results

## 🤖 AI Models Used

### Google Gemini
- **Model**: `gemini-1.5-pro-latest`
- **Max Tokens**: 1000
- **Temperature**: 0.5
- **Best For**: Detailed technical analysis

### OpenAI
- **Model**: `gpt-4o`
- **Max Tokens**: 1000
- **Temperature**: 0.5
- **Best For**: Contextual understanding

## ⚙️ Configuration

### Modify AI Prompts
Edit the prompts in `unconstrained_extraction_improved.py`:

```python
# Line 230-240 for Gemini prompt
prompt = """Analyze this HVAC/Electrical/Plumbing service image..."""

# Line 330-340 for OpenAI prompt
```

### Adjust Batch Size
```python
# Line 470
analyzer = ImprovedImageAnalyzer(batch_size=5, max_retries=3)
```

### Change Models
```python
# Line 127 - Gemini model
self.gemini_model = genai.GenerativeModel('gemini-1.5-pro-latest')

# Line 360 - OpenAI model
model="gpt-4o"
```

## 🔍 Entity Standardization

The system automatically standardizes common variations:

```python
'balance point': ['Balance Point', 'BalancePoint', 'BP']
'ac unit': ['AC unit', 'air conditioner', 'cooling unit']
'installation': ['installation', 'install', 'installing']
```

## 📈 Performance

- **Processing Speed**: ~12 seconds per batch of 5 images
- **Total Time (242 images)**: ~30-40 minutes
- **Cache Hit**: Instant for previously processed images
- **Retry Success**: 95%+ with exponential backoff

## 🐛 Troubleshooting

### "finish_reason: 2" Error
- This indicates Gemini 2.5 models are blocked
- Solution: System automatically uses gemini-1.5-pro-latest

### API Rate Limits
- System includes 2-second delays between batches
- Exponential backoff handles temporary failures

### Memory Issues
- Images are processed in batches to manage memory
- Results saved incrementally after each batch

## 🚦 Requirements

### API Limits
- **Gemini**: 360+ requests per minute (paid tier)
- **OpenAI**: Standard tier limits apply

### System Requirements
- **RAM**: 4GB minimum
- **Storage**: 1GB for cache
- **Network**: Stable internet connection

## 📝 License

This project is proprietary software for internal use.

## 🤝 Contributing

Internal contributions only. Please follow existing code style and patterns.

## 📞 Support

For issues or questions, contact the development team.

---

**Note**: This system is designed for analyzing service industry images to understand AI perception for SEO optimization. It does not identify individuals and focuses solely on equipment, brands, and service context.