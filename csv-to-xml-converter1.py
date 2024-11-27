import csv
import os
from xml.etree.ElementTree import Element, SubElement, ElementTree

def csv_to_xml(csv_file, xml_file):
    # Read the CSV file
    with open(csv_file, mode='r', encoding='utf-8') as file:
        reader = csv.DictReader(file)
        
        # Create the root XML element
        quiz = Element('quiz')
        
        for row in reader:
            question_element = SubElement(quiz, 'question')
            
            # Add the question text
            question_text = SubElement(question_element, 'text')
            question_text.text = row['Question']
            
            # Add options
            for i in range(1, 5):
                option = SubElement(question_element, f'option{i}')
                option.text = row[f'Option {i}']
            
            # Add the correct answer
            answer = SubElement(question_element, 'answer')
            answer.text = row['Answer'].strip()
        
        # Write to an XML file
        tree = ElementTree(quiz)
        tree.write(xml_file, encoding='utf-8', xml_declaration=True)
        print(f"Converted {csv_file} to {xml_file}")

# Define the input and output files
file_mapping = {
    'quiz-easy.csv': 'quiz-easy.xml',
    'quiz-medium.csv': 'quiz-medium.xml',
    'quiz-hard.csv': 'quiz-hard.xml',
}

# Convert each file
for csv_file, xml_file in file_mapping.items():
    if os.path.exists(csv_file):
        csv_to_xml(csv_file, xml_file)
    else:
        print(f"File not found: {csv_file}")
