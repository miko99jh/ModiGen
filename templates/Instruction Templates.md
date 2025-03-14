**Instruction for prompt generation:**
I have collected a set of Modelica models and used them to construct a benchmark for evaluating Modelica code generation. The data is stored in JSONL format with each entry containing the following fields: \{"modelica version": "", "description": "", "documentation": "", "model": "", "source": ""\}
% \\\\
% The text description of these models (description and documentation) is not always sufficient for generating accurate models. The description usually provides a brief summary of the model's role, and the documentation provides an annotated description. To improve accuracy in generating Modelica models, please generate a detailed and specific prompt for each piece of data, based on the following guidelines: 
% \\\\
% 1. \textbf{Model Functionality}: Clearly describe the functionality and purpose of the model.

% 2. \textbf{Parameters}: Show clearly the data types, the values and units(optional) of model's input, output and other parameters to ensure accurate representation of the model's requirements.

% 3. \textbf{Equations and Expressions}: Provide the complex equations involved in the model.

% 4. \textbf{Inheritance and Interfaces} (if applicable): If the model inherits or uses other models or components, indicate the inherited model, including the details of the interface, parameterization, and how the model extends or overrides the parent component.
% \\\\
% Please generate the most suitable prompt for each piece of data according to its detailed content. The prompt will be used as input for the large language model to generate the corresponding Modelica model more accurately. Note: You only need to generate the required prompt for each JSONL data and output it in the JSONL format, for example, '\{"prompt": ""\}', do not generate other text content. I will provide the data one by one below.
