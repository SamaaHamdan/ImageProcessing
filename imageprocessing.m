function varargout = guiProject(varargin)
% GUIPROJECT MATLAB code for guiProject.fig
%      GUIPROJECT, by itself, creates a new GUIPROJECT or raises the existing
%      singleton*.
%
%      H = GUIPROJECT returns the handle to a new GUIPROJECT or the handle to
%      the existing singleton*.
%
%      GUIPROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIPROJECT.M with the given input arguments.
%
%      GUIPROJECT('Property','Value',...) creates a new GUIPROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiProject_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiProject_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiProject

% Last Modified by GUIDE v2.5 28-Nov-2021 18:53:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiProject_OpeningFcn, ...
                   'gui_OutputFcn',  @guiProject_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function guiProject_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiProject (see VARARGIN)

% Choose default command line output for guiProject
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

function varargout = guiProject_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function Browse_Callback(hObject, eventdata, handles)
% hObject    handle to Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.*', 'Pick a MATLAB code file');
    if isequal(filename,0) || isequal(pathname,0)
       disp('User pressed cancel')
    else
       filename=strcat(pathname,filename);
       a=imread(filename);
       axes(handles.axes1);
       imshow(a);
       handles.a=a;
       guidata(hObject, handles);
    end

% --- Executes on button press in RGB2gray.
function RGB2gray_Callback(hObject, eventdata, handles)
% hObject    handle to RGB2gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.a;
op=getappdata(0,'option');
ratio=getappdata(0,'ratioo');

new=Rgb2Gray(img, op, ratio);

axes(handles.axes2);
imshow(new);

% --- Executes on button press in gray2binary.
function gray2binary_Callback(hObject, eventdata, handles)
% hObject    handle to gray2binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.a;
T=getappdata(0,'threshold');

result=greyToBinary(img, T);

axes(handles.axes2);
imshow(result);

% --- Executes on button press in RGB2binary.
function RGB2binary_Callback(hObject, eventdata, handles)
% hObject    handle to RGB2binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.a;
T=getappdata(0,'thre');
result = RGB2Binary(img, T);
axes(handles.axes2);
imshow(result);

% --- Executes on button press in Brightness.
function Brightness_Callback(hObject, eventdata, handles)
% hObject    handle to Brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.a;
op=getappdata(0,'opt');
k=getappdata(0,'k');     %double is used to bright in case of + and /
result = Brightness(img, op, k);
axes(handles.axes2);
imshow(result);

% --- Executes on button press in Darkness.
function Darkness_Callback(hObject, eventdata, handles)
% hObject    handle to Darkness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.a;
op=getappdata(0,'darkop');
k=getappdata(0,'KK');   %double is used to dark in case of - and *
result = darkness(img, op, k);
axes(handles.axes2);
imshow(result);


% --- Executes on button press in Log.
function Log_Callback(hObject, eventdata, handles)
% hObject    handle to Log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.a;
c=getappdata(0,'const');

s = Log(img, c);
axes(handles.axes2);
imshow(s);


% --- Executes on button press in Exponential.
function Exponential_Callback(hObject, eventdata, handles)
% hObject    handle to Exponential (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.a;
c=getappdata(0,'const');

s = InvLog(img, c);
axes(handles.axes2);
imshow(s);


% --- Executes on button press in Negative.
function Negative_Callback(hObject, eventdata, handles)
% hObject    handle to Negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.a;

S = Negative(img);
axes(handles.axes2);
imshow(S);
       
% --- Executes on button press in Gamma.
function Gamma_Callback(hObject, eventdata, handles)
% hObject    handle to Gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.a;
c=getappdata(0,'const');
y=getappdata(0,'Y');

S= Gamma(img, c, y);

axes(handles.axes2);
imshow(S);

% --- Executes on button press in ContrastStretch.
function ContrastStretch_Callback(hObject, eventdata, handles)
img=handles.a;
%itemp = imread('pout.tif'); %read the image
S = Constract_Stertching(img);

axes(handles.axes2);
imshow(S);  

% --- Executes on button press in Histogram.
function Histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.a;

s=drawHist(img);
axes(handles.axes2);
imshow(s);

% --- Executes on button press in correlationFilter.
function correlationFilter_Callback(hObject, eventdata, handles)
% hObject    handle to correlationFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.a;
option=getappdata(0,'optioncorrelation');
S=correlationFilter(img,option);
axes(handles.axes2);
imshow(S);

% --- Executes on button press in Idealfilter.
function Idealfilter_Callback(hObject, eventdata, handles)
% hObject    handle to Idealfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image=handles.a;
option=getappdata(0,'optionideal');
D0=getappdata(0,'Dideal');
S=IdealFilter(image,D0,option);
axes(handles.axes2);
imshow(S);   

% --- Executes on button press in GuassianFilter.
function GuassianFilter_Callback(hObject, eventdata, handles)
% hObject    handle to GuassianFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image=handles.a;
option=getappdata(0,'gaussop');
D0=getappdata(0,'guassD0');
S=GaussianFilter(image,D0,option);
axes(handles.axes2);
imshow(S);

% --- Executes on button press in domain.
function domain_Callback(hObject, eventdata, handles)
% hObject    handle to domain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image=handles.a;
option=getappdata(0,'domainop');
S=DomainConversions(image, option);
axes(handles.axes2);
imshow(S);  



function rgb2grayoption_Callback(hObject, eventdata, handles)
% hObject    handle to rgb2grayoption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.rgb2grayoption,'String'));
setappdata(0,'option',a);

% Hints: get(hObject,'String') returns contents of rgb2grayoption as text
%        str2double(get(hObject,'String')) returns contents of rgb2grayoption as a double


% --- Executes during object creation, after setting all properties.
function rgb2grayoption_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rgb2grayoption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rgb2grayRatio_Callback(hObject, eventdata, handles)
% hObject    handle to rgb2grayRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.rgb2grayRatio,'String'));
setappdata(0,'ratioo',a);
% Hints: get(hObject,'String') returns contents of rgb2grayRatio as text
%        str2double(get(hObject,'String')) returns contents of rgb2grayRatio as a double


% --- Executes during object creation, after setting all properties.
function rgb2grayRatio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rgb2grayRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gray2binarythreshold_Callback(hObject, eventdata, handles)
% hObject    handle to gray2binarythreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.gray2binarythreshold,'String'));
setappdata(0,'threshold',a);
% Hints: get(hObject,'String') returns contents of gray2binarythreshold as text
%        str2double(get(hObject,'String')) returns contents of gray2binarythreshold as a double


% --- Executes during object creation, after setting all properties.
function gray2binarythreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gray2binarythreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rgb2binarythre_Callback(hObject, eventdata, handles)
% hObject    handle to rgb2binarythre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.rgb2binarythre,'String'));
setappdata(0,'thre',a);

% Hints: get(hObject,'String') returns contents of rgb2binarythre as text
%        str2double(get(hObject,'String')) returns contents of rgb2binarythre as a double


% --- Executes during object creation, after setting all properties.
function rgb2binarythre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rgb2binarythre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function brightioption_Callback(hObject, eventdata, handles)
% hObject    handle to brightioption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.brightioption,'String');
setappdata(0,'opt',a);
% Hints: get(hObject,'String') returns contents of brightioption as text
%        str2double(get(hObject,'String')) returns contents of brightioption as a double


% --- Executes during object creation, after setting all properties.
function brightioption_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brightioption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function brightconstant_Callback(hObject, eventdata, handles)
% hObject    handle to brightconstant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.brightconstant,'String'));
setappdata(0,'k',a);
% Hints: get(hObject,'String') returns contents of brightconstant as text
%        str2double(get(hObject,'String')) returns contents of brightconstant as a double


% --- Executes during object creation, after setting all properties.
function brightconstant_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brightconstant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function darkoption_Callback(hObject, eventdata, handles)
% hObject    handle to darkoption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.darkoption,'String');
setappdata(0,'darkop',a);
% Hints: get(hObject,'String') returns contents of darkoption as text
%        str2double(get(hObject,'String')) returns contents of darkoption as a double


% --- Executes during object creation, after setting all properties.
function darkoption_CreateFcn(hObject, eventdata, handles)
% hObject    handle to darkoption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function darkconst_Callback(hObject, eventdata, handles)
% hObject    handle to darkconst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.darkconst,'String'));
setappdata(0,'KK',a);
% Hints: get(hObject,'String') returns contents of darkconst as text
%        str2double(get(hObject,'String')) returns contents of darkconst as a double


% --- Executes during object creation, after setting all properties.
function darkconst_CreateFcn(hObject, eventdata, handles)
% hObject    handle to darkconst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function loggg_Callback(hObject, eventdata, handles)
% hObject    handle to loggg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.loggg,'String'));
setappdata(0,'const',a);
% Hints: get(hObject,'String') returns contents of loggg as text
%        str2double(get(hObject,'String')) returns contents of loggg as a double


% --- Executes during object creation, after setting all properties.
function loggg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to loggg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function exp_Callback(hObject, eventdata, handles)
% hObject    handle to exp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.exp,'String'));
setappdata(0,'const',a);
% Hints: get(hObject,'String') returns contents of exp as text
%        str2double(get(hObject,'String')) returns contents of exp as a double


% --- Executes during object creation, after setting all properties.
function exp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gammaconst_Callback(hObject, eventdata, handles)
% hObject    handle to gammaconst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.gammaconst,'String'));
setappdata(0,'const',a);
% Hints: get(hObject,'String') returns contents of gammaconst as text
%        str2double(get(hObject,'String')) returns contents of gammaconst as a double


% --- Executes during object creation, after setting all properties.
function gammaconst_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gammaconst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gammay_Callback(hObject, eventdata, handles)
% hObject    handle to gammay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.gammay,'String'));
setappdata(0,'Y',a);
% Hints: get(hObject,'String') returns contents of gammay as text
%        str2double(get(hObject,'String')) returns contents of gammay as a double


% --- Executes during object creation, after setting all properties.
function gammay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gammay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function correlationoption_Callback(hObject, eventdata, handles)
% hObject    handle to correlationoption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.correlationoption,'String'));
setappdata(0,'optioncorrelation',a);
% Hints: get(hObject,'String') returns contents of correlationoption as text
%        str2double(get(hObject,'String')) returns contents of correlationoption as a double


% --- Executes during object creation, after setting all properties.
function correlationoption_CreateFcn(hObject, eventdata, handles)
% hObject    handle to correlationoption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function butteroption_Callback(hObject, eventdata, handles)
% hObject    handle to butteroption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.butteroption,'String'));
setappdata(0,'optionbutter',a);
% Hints: get(hObject,'String') returns contents of butteroption as text
%        str2double(get(hObject,'String')) returns contents of butteroption as a double


% --- Executes during object creation, after setting all properties.
function butteroption_CreateFcn(hObject, eventdata, handles)
% hObject    handle to butteroption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function butterd0_Callback(hObject, eventdata, handles)
% hObject    handle to butterd0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.butterd0,'String'));
setappdata(0,'Dbutter',a);
% Hints: get(hObject,'String') returns contents of butterd0 as text
%        str2double(get(hObject,'String')) returns contents of butterd0 as a double


% --- Executes during object creation, after setting all properties.
function butterd0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to butterd0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function idealoption_Callback(hObject, eventdata, handles)
% hObject    handle to idealoption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.idealoption,'String'));
setappdata(0,'optionideal',a);
% Hints: get(hObject,'String') returns contents of idealoption as text
%        str2double(get(hObject,'String')) returns contents of idealoption as a double


% --- Executes during object creation, after setting all properties.
function idealoption_CreateFcn(hObject, eventdata, handles)
% hObject    handle to idealoption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function idealD_Callback(hObject, eventdata, handles)
% hObject    handle to idealD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.idealD,'String'));
setappdata(0,'Dideal',a);
% Hints: get(hObject,'String') returns contents of idealD as text
%        str2double(get(hObject,'String')) returns contents of idealD as a double


% --- Executes during object creation, after setting all properties.
function idealD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to idealD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function guassoption_Callback(hObject, eventdata, handles)
% hObject    handle to guassoption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.guassoption,'String'));
setappdata(0,'gaussop',a);
% Hints: get(hObject,'String') returns contents of guassoption as text
%        str2double(get(hObject,'String')) returns contents of guassoption as a double


% --- Executes during object creation, after setting all properties.
function guassoption_CreateFcn(hObject, eventdata, handles)
% hObject    handle to guassoption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function guassD_Callback(hObject, eventdata, handles)
% hObject    handle to guassD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.guassD,'String'));
setappdata(0,'guassD0',a);
% Hints: get(hObject,'String') returns contents of guassD as text
%        str2double(get(hObject,'String')) returns contents of guassD as a double


% --- Executes during object creation, after setting all properties.
function guassD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to guassD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function domainop_Callback(hObject, eventdata, handles)
% hObject    handle to domainop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.domainop,'String'));
setappdata(0,'domainop',a);

% Hints: get(hObject,'String') returns contents of domainop as text
%        str2double(get(hObject,'String')) returns contents of domainop as a double


% --- Executes during object creation, after setting all properties.
function domainop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to domainop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Butterworth.
function Butterworth_Callback(hObject, eventdata, handles)
% hObject    handle to Butterworth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image=handles.a;
option=getappdata(0,'optionbutter');
D0=getappdata(0,'Dbutter');
S=ButterworthFilter(image,D0,option);
axes(handles.axes2);
imshow(S);   
