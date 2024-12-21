curl http://localhost:8880/v2/models/ensemble/generate_stream \
  -H "Accept: application/json" -H "Content-type: application/json" -X POST \
  -d '{
    "text_input": "def quick_sort",
    "max_tokens": 256,
    "temperature": 0.2,
    "stream": true
  }'