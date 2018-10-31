FROM dload/ihaskell:latest

RUN pip3 install -U jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
# Add vim bindings
# Create required directory in case (optional)
RUN mkdir -p $(jupyter --data-dir)/nbextensions
# Clone the repository
RUN git clone https://github.com/lambdalisue/jupyter-vim-binding $(jupyter --data-dir)/nbextensions/vim_binding
# Activate the extension
RUN jupyter nbextension enable vim_binding/vim_binding

WORKDIR /Notebooks

CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
