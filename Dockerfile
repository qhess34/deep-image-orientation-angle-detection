FROM python:3.9

RUN apt-get update && apt-get install -y \
    libgl1 libsm6 libxext6 libxrender1 \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    libimage-exiftool-perl \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app
COPY requirements.txt .

RUN pip install -r requirements.txt
RUN pip install torch torchvision torchaudio 
RUN pip install -U scikit-learn scipy matplotlib pandas

COPY . .

CMD ["python", "run.py"]
