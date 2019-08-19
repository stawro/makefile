cc = gcc
obj_files = main.o DIO.o LCD.o
obj2_files = eldakhly-mina-stawro-yousef.o
link_target = app.exe
clean_files = $(obj_files) $(link_target)
inc_path = .\Includes
dep_path = .\Dependencise

vpath %.c .\Src

%.o : %.c
	$(cc) -c -I$(inc_path) $< -o $@

clean :
		rm $(clean_files)
		
$(link_target) : $(obj_files) $(obj2_files)
		$(cc) $^ -o $@