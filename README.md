# terminal-smushit

Otimizar as imagens de qualquer projeto web é fundamental. O [Yahoo Smush.it](http://www.smushit.com/ysmush.it/) faz esse trabalho com muita eficiência.

Porém enviar imagens uma a uma pelo site do Smush.it, depois fazer o download não é um fluxo muito interessante. Seria mais fácil otimizar as imagens de um diretório e 
sub-diretórios sem precisar visitar o site do Smush.it ou selecionar imagem por imagem concorda? Não seria bem mais simples algo como:

    smushit /home/macaco/bananas/imagens/ 
   
É justamente esta proposta que temos aqui :D

Baseado no post [A command line tool to run smush.it](http://abhirama.wordpress.com/2010/10/20/a-command-line-tool-to-run-smush-it/) organizei esses arquivos para tornar essa tarefa menos dolorosa.

**Atenção:** É muito importante lembrar que autoria do arquivo *smushit.jar* ( responsável por toda mágica) não é minha, o que fiz foi organizar as coisas a modo de tornar mais simples de usar, 
e compartilhar esta organização. O repositório oficial deste arquivo encontra-se no [bitbucket](https://bitbucket.org/abhirama/smushit) .


## Simplificando sua vida ( Usando o smushit.jar )

Depois de baixar os arquivos do terminal-smushit, entre no diretório dele e execute:

    java -jar smushit.jar -imageDir='/home/SEUNOME/imagens/' -verbose=true -dryRun=false
    
Pronto, basta aguardar. Todas as imagens do diretório informado (e dos sub-diretórios também) serão enviadas ao Smush.it, otimizadas e por fim será feito o download das mesmas, 
substituindo automaticamente as imagens "pesadas"

### Tenho muitas imagens, isso pode ser uma problema ?

Não, não precisa se preocupar, o processo é feito em lote. É selecionada uma quantidade de imagens, enviadas, otimizadas e substituidas, e depois uma nova quantidade passa pelo mesmo processo 
até que todas sejam otimizadas.

Antes que você se pergunte... Não, não é necessário rodar o comando mais de uma vez, uma vez executado o comando tudo isso é feito automaticamente, você pode ir tomar um cafézinho enquanto todo 
processo é executado.


## Simplificando ainda mais ( Usando o shellscript )

Muito legal! Mas não consigo lembrar de todos os argumentos necessários pra rodar o smushit.jar, toda vez preciso ver no arquivo *smushit-README.txt* quais são. 

Então use o *smushit.sh* que passa os argumentos pra você. Basta executar:

    ./smushit.sh /home/SEUNOME/imagens/

Pronto a mágica será iniciada! Você pode personalizar o *smushit.sh* ao seu modo, afinal cada pessoa/projeto tem suas particularidades.

**Atenção:** Não esqueça de dá permissão de execução para o *smushit.sh*, basta rodar o comando:

    chmod +x smushit.sh
    
## Mais simples ainda, pode ? ( Usando um alias )

Pode! Nos dois métodos acima você deve estar no diretório onde os scripts estão salvos, ou informá-los no momento da execução. Imagine que você esta 10 niveis de diretórios a dentro no seu projeto, 
e agora quer otimizar as imagens, você precisaria de algo do tipo:

    ../../../../../../../../../../terminal-smushit/smushit.sh /home/USUARIO/PROJETO/IMAGENS/ 
    
Fica complicado né? Então pra simplificar ainda mais, é possivel fazer uso dos alias e não se preocupar mais com a localização do script nem os argumentos que ele exige.

Edite seu arquivo *.bash_profile*  adicionando as linhas:

    # yahoo smushit
    function_smushit(){
    	java -jar ~/terminal-smushit/smushit.jar -imageDir=$1 -verbose=true -dryRun=false
    }
    alias smushit=function_smushit 
    
E depois faça o reload do mesmo:

    source .bash_profile
    

**Atenção:** É necessário informar o caminho completo do nosso arquivo *smushit.jar* , no caso acima o mesmo esta em */Users/MEUNOME/terminal-smushit/smushit.jar* que é o mesmo que *~/terminal-smushit/smushit.jar* 
se você salvou os scripts em outro local, edite neste momento.

**Onde fica o *.bash_profile* ?** 

No Mac geralmente em:
 
    /Users/SEUNOME/.bash_profile

No linux geralmente em:

    /home/SEUNOME/.bash_profile
    

Depois de criar seu alias, tudo ficará mais facil. Em qualquer local do seu sistema operacional, vc pode usar o comando pra otimizar a imagem:

    smushit /CAMINHO/RELATIVO/IMAGENS/
    

Espero que seja de serventia a vocês assim como tem sido para mim.

    
