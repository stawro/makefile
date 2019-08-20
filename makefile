cc = gcc
src = main.c LCD.c DIO.c 
hdr = main.h LCD.h DIO.h code.h
obj_files = main.o DIO.o LCD.o
dep_file = main.d DIO.d LCD.d 
obj2_files = eldakhly-mina-stawro-yousef.o
link_target = app.exe
clean_files = $(obj_files) $(link_target)
inc_path = ./Includes
src_path = ./Src
dep_path = ./Dependencise
#CFLAGS = -O2 -MD
-include $(dep_files2)

vpath %.c ./Src

%.o : %.c $(inc_path)/%.h
	$(cc) -c -MD -I$(inc_path) $< -o $@
	mv *.d $(dep_path)

obj : main.c LCD.c DIO.c 
	$(cc) -c -I$(inc_path) Src/main.c -o main.o
	$(cc) -c -I$(inc_path) Src/LCD.c -o LCD.o
	$(cc) -c -I$(inc_path) Src/DIO.c -o DIO.o
	  

clean :
		rm $(clean_files)
		
$(link_target) : $(obj_files) $(obj2_files)
		$(cc) $^ -o $@
		$(cc) -MM -I$(inc_path) $< > $(dep_path)\$*.d


#%.d : %.c
#	$(cc) -M -I$(inc_path) $< -MF $(dep_path)\$@

#-include $(Src:.c=.d) $(obj_files:.o=.d) $(obj2_files:.o=.d) $(hdr:.h=.d)