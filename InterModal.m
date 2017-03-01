function varargout = InterModal(varargin)
% INTERMODAL MATLAB code for InterModal.fig
%      INTERMODAL, by itself, creates a new INTERMODAL or raises the existing
%      singleton*.
%
%      H = INTERMODAL returns the handle to a new INTERMODAL or the handle to
%      the existing singleton*.
%
%      INTERMODAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERMODAL.M with the given input arguments.
%
%      INTERMODAL('Property','Value',...) creates a new INTERMODAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InterModal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InterModal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InterModal

% Last Modified by GUIDE v2.5 17-Aug-2015 22:32:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InterModal_OpeningFcn, ...
                   'gui_OutputFcn',  @InterModal_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before InterModal is made visible.
function InterModal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InterModal (see VARARGIN)

% Choose default command line output for InterModal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InterModal wait for user response (see UIRESUME)
% uiwait(handles.figure1);
sliderVal=get(handles.sliderOmegaf,'Value');
set(handles.textOmegaf,'String',num2str(sliderVal));
assignin('base','omegaf',sliderVal);

sliderVal=get(handles.sliderF0,'Value');
set(handles.textF0,'String',num2str(sliderVal));
assignin('base','F0',sliderVal);
sliderVal=get(handles.sliderTfinal,'Value');
set(handles.textTfinal,'String',num2str(sliderVal));
assignin('base','Tf',sliderVal);

assignin('base','B',[1 0 0]);
calcmodes()

% --- Outputs from this function are returned to the command line.
function varargout = InterModal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure1);


% --- Executes on slider movement.
function sliderOmegaf_Callback(hObject, eventdata, handles)
% hObject    handle to sliderOmegaf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
sliderVal=get(hObject,'Value');
assignin('base','omegaf',sliderVal);
set(handles.textOmegaf,'String',num2str(sliderVal));
calcmodes();

% --- Executes during object creation, after setting all properties.
function sliderOmegaf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderOmegaf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderF0_Callback(hObject, eventdata, handles)
% hObject    handle to sliderF0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
F0Val=get(hObject,'Value');
assignin('base','F0',F0Val);
set(handles.textF0,'String',num2str(F0Val));
calcmodes();

% --- Executes during object creation, after setting all properties.
function sliderF0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderF0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderTfinal_Callback(hObject, eventdata, handles)
% hObject    handle to sliderTfinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

TfinalVal=get(hObject,'Value');
assignin('base','Tf',TfinalVal);
set(handles.textTfinal,'String',num2str(TfinalVal));
calcmodes();

% --- Executes during object creation, after setting all properties.
function sliderTfinal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderTfinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
B=get(hObject,'UserData');
assignin('base','B',B);
calcmodes()