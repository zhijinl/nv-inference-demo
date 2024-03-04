import os
import torch
import monai
import random


model_config_file = './bundle/breast_density_classification/configs/inference.json'
model_config = monai.bundle.ConfigParser()
model_config.read_config(model_config_file)


top_dir = './bundle/breast_density_classification/sample_data'
preprocessing = model_config.get_parsed_content('preprocessing')

all_data = []
    
for root, dirs, files in os.walk(top_dir):
    for curr_f in files:
        if curr_f.lower().endswith('.jpg'):
            sample_image = os.path.join(root, curr_f)
            input_data = preprocessing({'image': sample_image})
            input_data = torch.unsqueeze(input_data['image'], 0)
                
            all_data.append(input_data.array)
            
def load_data():
    for _ in range(1000):
        yield {'x.1': random.choice(all_data)}